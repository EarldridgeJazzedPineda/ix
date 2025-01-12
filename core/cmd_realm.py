import os
import json
import shutil
import subprocess

import core.gg as cg
import core.lex as cc
import core.repo as cr
import core.utils as cu
import core.config as cf
import core.manager as cm


def group_realms(l):
    d = []

    for x in l:
        kind, op, v = x

        if d and d[-1][2]['r'] != v['r']:
            yield d
            d = []

        d.append(x)

    if d:
        yield d


def prepare(ctx, args):
    mngr = cm.Manager(cf.config_from(ctx))
    nodes = [mngr.ensure_realm(d[0][2]['r']).mut(d) for d in group_realms(cc.lex(args))]
    graph = cg.build_graph(nodes)

    if os.environ.get('IX_DUMP_GRAPH', ''):
        print(json.dumps(graph, indent=4, sort_keys=True))

        return

    mngr.config.ops.execute_graph(graph)

    for n in nodes:
        yield n.from_prepared()


def cli_mut(ctx):
    for r in list(prepare(ctx, ctx['args'])):
        r.install()


def cli_let(ctx):
    list(prepare(ctx, ctx['args']))


def cli_run(ctx):
    args = ctx['args']

    for r in reversed(list(prepare(ctx, ['ephemeral'] + args[:args.index('--')] + ['bin/ix/runner']))):
        cmd = ['runner_entry', f'{r.path}/env'] + args[args.index('--') + 1:]
        env = os.environ.copy()
        env['OLDPATH'] = env.get('PATH', '')
        env['PATH'] = f'/nowhere:{r.path}/bin'
        exe = shutil.which(cmd[0], path=env['PATH'])

        return os.execvpe(exe, cmd, env)


def cli_build(ctx):
    list(prepare(ctx, ['ephemeral'] + ctx['args']))


def cli_list(ctx):
    repo = cr.Repo(cf.config_from(ctx))

    if ctx['args']:
        for a in ctx['args']:
            for x in repo.load_realm(a).pkgs['list']:
                print(x)
    else:
        for r in repo.list_realms():
            repo.load_realm(r)
            print(r)


def cli_purge(ctx):
    mngr = cm.Manager(cf.config_from(ctx))

    for r in ctx['args']:
        cr.Repo(mngr.config).load_realm(r).to_rw(mngr).uninstall()
