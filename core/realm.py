#!/usr/bin/env python3

import os
import sys
import json
import base64
import shutil
import string
import getpass
import itertools
import subprocess

import core.log as cl
import core.sign as cs
import core.utils as cu
import core.error as ce


def realm_path(config, name):
    return os.path.join(config.realm_dir, name)


def struct(ops):
    d = {}

    for kind, op, v in ops:
        if kind == 'r':
            # TODO(pg): support remove of realm
            pass
        elif kind == 'p':
            p = v['p']

            if op == '+':
                if p not in d:
                    d[p] = dict()
            else:
                d.pop(p)
        elif kind == 'f':
            p = v['p']
            fk, fv = v['f']

            if op == '+':
                d[p][fk] = fv
            else:
                d[p].pop(fk)

    return [{'name': x, 'flags': y} for x, y in d.items()]


def destruct(pkgs):
    for x in pkgs:
        p = x['name']

        yield ('p', '+', {'p': p})

        for x in x['flags'].items():
            yield ('f', '+', {'p': p, 'f': x})


def rev_lst(l):
    return list(reversed(l))


def apply_patch_1(flags, pkgs, patch):
    res = struct(list(destruct([{'name': None, 'flags': flags}] + pkgs)) + patch)

    assert not res[0]['name']

    return {
        'flags': res[0]['flags'],
        'list': res[1:]
    }


def apply_patch(flags, pkgs, patch):
    res = apply_patch_1(flags, rev_lst(pkgs), patch)
    res['list'] = rev_lst(res['list'])

    return res


def flatten(flags, pkgs):
    for p in pkgs:
        yield {
            'name': p['name'],
            'flags': cu.dict_dict_update(flags, p.get('flags', {})),
        }


GOOD = frozenset(string.ascii_letters + string.digits)


def check_name(name):
    for ch in name:
        assert ch in GOOD


class RealmCtx:
    def __init__(self, mngr, name, pkgs):
        self.mngr = mngr
        self.pkg_name = name
        self.pkgs = pkgs
        self.uid = cs.UID
        self.uid = list(self.iter_build_commands())[-1]['uid']

    def fake_selector(self):
        return {
            'name': f'namespace {self.pkg_name}',
            'flags': self.pkgs['flags'],
        }

    @property
    def out_dir(self):
        return f'{self.mngr.config.store_dir}/{self.uid}-rlm-{self.pkg_name}'

    def flat_pkgs(self):
        return flatten(self.pkgs['flags'], self.pkgs['list'])

    def load_packages(self, pkgs):
        return self.mngr.load_packages(pkgs, self.fake_selector())

    def calc_all_runtime_depends(self):
        for p in self.load_packages(self.flat_pkgs()):
            yield p
            yield from p.iter_all_runtime_depends()

    @cu.cached_method
    def iter_all_runtime_depends(self):
        return list(cu.uniq_p(self.calc_all_runtime_depends()))

    def calc_all_build_depends(self):
        flags = {}

        for k, v in self.pkgs['flags'].items():
            flags['target_' + k] = v

        for p in self.load_packages([{'name': 'bld/realm', 'flags': flags}]):
            yield p
            yield from p.iter_all_runtime_depends()

        yield from self.iter_all_runtime_depends()

    @cu.cached_method
    def iter_all_build_depends(self):
        return list(cu.uniq_p(self.calc_all_build_depends()))

    def iter_build_commands(self):
        yield cs.replace_sentinel({
            'uid': self.uid,
            'in_dir': [x.out_dir for x in self.iter_all_build_depends()],
            'out_dir': [self.out_dir],
            'cmd': [self.build_cmd()],
            'pool': 'misc',
        })

    def buildable(self):
        return True

    def build_cmd(self):
        descr = {
            'pkgs': self.pkgs,
            'links': [p.out_dir for p in self.iter_all_runtime_depends()],
        }

        return {
            'args': ['prepare_realm', self.out_dir],
            'stdin': json.dumps(descr),
            'env': {
                'PATH': ':'.join((x.out_dir + '/bin' for x in self.iter_all_build_depends())),
            },
        }

    def from_prepared(self):
        return Realm(self.mngr, self.pkg_name, self.out_dir)


class BaseRealm:
    def __init__(self, mngr, name):
        check_name(name)

        self.mngr = mngr
        self.name = name

    def new_version(self, pkgs):
        return prepare_realm_ctx(self.mngr, self.name, pkgs)

    def mut(self, patch):
        return self.new_version(apply_patch(self.pkgs['flags'], self.pkgs['list'], patch))

    @property
    def managed_path(self):
        return realm_path(self.mngr.config, self.name)

    def uninstall(self):
        os.unlink(self.managed_path)


def read_realm(path):
    with open(os.path.join(path, 'touch'), 'r') as f:
        pass

    with open(os.path.join(path, 'meta.json'), 'r') as f:
        return json.loads(f.read())


class Realm(BaseRealm):
    def __init__(self, mngr, name, path):
        BaseRealm.__init__(self, mngr, name)

        self.path = path
        self.meta = read_realm(self.path)

    @property
    def pkgs(self):
        return self.meta['pkgs']

    @property
    def links(self):
        return self.meta['links']

    def install(self):
        path = self.managed_path

        try:
            os.makedirs(os.path.dirname(path))
        except Exception:
            pass

        tmp = path + '.tmp'

        try:
            os.unlink(tmp)
        except Exception:
            pass

        os.symlink(self.path, tmp)
        cu.sync()

        try:
            os.rename(tmp, path)
        except PermissionError:
            cl.log(f'FIXLN {path} owner', color='y')
            u = getpass.getuser()
            subprocess.check_call(['sudo', 'chown', '-h', f'{u}:{u}', path])
            os.rename(tmp, path)

        cu.sync()

        cl.log(f'SYMLN {path}', color='y', bright=True)


class RORealm:
    def __init__(self, name, path):
        check_name(name)

        self.name = name
        self.path = path
        self.meta = read_realm(self.path)

    @property
    def pkgs(self):
        return self.meta['pkgs']

    @property
    def links(self):
        return self.meta['links']

    def to_rw(self, mngr):
        return Realm(mngr, self.name, self.path)


def load_realm_ro(config, name):
    rp = realm_path(config, name)

    try:
        return RORealm(name, os.readlink(rp))
    except AssertionError as e:
        raise ce.Error(f'malformed realm link "{rp}", prease remove it manualy', exception=e)


def prepare_realm_ctx(mngr, name, pkgs):
    check_name(name)

    return RealmCtx(mngr, name, pkgs)


class NewRealm(BaseRealm):
    @property
    def pkgs(self):
        return {
            'list': [],
            'flags': {},
        }

    @property
    def links(self):
        return []


def new_realm(mngr, name):
    check_name(name)

    return NewRealm(mngr, name)
