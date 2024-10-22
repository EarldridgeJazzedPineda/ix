{% extends '//die/c/ix.sh' %}

{% block task_pool %}full{% endblock %}

{% block rustc_ver %}
80
{% endblock %}

{% block std_env %}
bld/pzd
bld/python
bld/pkg/config
bld/rust/devendor
{% if help %}
bin/cargo/whatfeatures
{% endif %}
{{super()}}
bld/rust(rustc_ver={{self.rustc_ver().strip()}})
{% endblock %}

{% block unpack %}
mkdir src; cd src
des ${src}/*.pzd .
rust_devendor vendored
{% endblock %}

{% block cargo_refine %}
{% endblock %}

{% block cargo_ver %}
v3
{% endblock %}

{% block bld_data %}
aux/cargo/{{self.cargo_ver().strip()}}(url={{self.cargo_url().strip()}},sha={{self.cargo_sha().strip()}},parent_id={{self.cargo_sha().strip()}},refine={{self.cargo_refine().strip() | b64e}})
{% endblock %}

{% block host_libs %}
lib/shim/fake(lib_name=gcc_s)
{% endblock %}

{% block setup_host_flags %}
export LDFLAGS="-L${LD_LIBRARY_PATH} ${LDFLAGS}"
{% endblock %}

{% block setup_target_flags %}
{{super()}}
export CARGO_BUILD_JOBS=16
export CARGO_INSTALL_ROOT=${out}
export CARGO_TARGET_DIR=${tmp}
export CARGO_HOME=${PWD}/.cargo
export OPENSSL_NO_VENDOR=yes
{% endblock %}

{% block setup_tools %}
export TARGET_CC=$(which cc)

cat << EOF > cc
#!/usr/bin/env python3

import sys
import subprocess

target_cc="${TARGET_CC}"
host_cc="${HOST_CC}"

def flt_target(cmd):
    for x in cmd:
        if 'self-contained' in x and '.o' in x:
            continue
        elif 'self-contained' in x:
            yield '/nowhere'
        elif '-Wl,' in x:
            continue
        elif '-lunwind' in x:
            continue
        elif x == '-static-pie':
            continue
        else:
            yield x

def flt_host(cmd):
    return cmd

def run():
    for cc in (host_cc, target_cc):
        try:
            return subprocess.check_call([cc] + sys.argv[1:])
        except Exception as e:
            err = e

        try:
            return subprocess.check_call(list(flt_target([cc] + sys.argv[1:])))
        except Exception as e:
            err = e

    raise err

run()
EOF

cp cc c++

chmod +x cc c++
{% endblock %}

{% block cargo_features %}
default
{% endblock %}

{% set cargo_options %}
{% block cargo_options %}
{% endblock %}
{% if bin %}
--bins
{% endif %}
{% if lib %}
--lib
{% endif %}
{% if self.cargo_features().strip() == 'default' %}
{% else %}
--no-default-features
{% for x in ix.parse_list(self.cargo_features()) %}
--features {{x}}
{% endfor %}
{% endif %}
{% endset %}

{% block build %}
{% if help %}
cargo whatfeatures --offline .
exit 1
{% endif %}
export CC=$(command -v cc)
export CXX=$(command -v c++)
export HOST_CC=${CC}
export HOST_CXX=${CXX}
export TARGET_CC=${CC}
export TARGET_CXX=${CXX}
cargo build --offline --release {{ix.fix_list(cargo_options)}}
{% endblock %}
