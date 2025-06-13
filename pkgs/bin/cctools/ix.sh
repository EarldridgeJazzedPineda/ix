{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/tpoechtrager/cctools-port/archive/236a426c1205a3bfcf0dbb2e2faf2296f0a100e5.tar.gz
f7c73122ebb0ea2cf094639b9ae387857d528337fea3d07d9800d9d0980241af
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/objc
lib/bsd/overlay
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_tool %}
bld/auto
{% endblock %}

{% block unpack %}
{{super()}}
cd cctools
{% endblock %}

{% block patch_configure %}
{{super()}}
sed -e 's/__arm__/__eat_shit__/' -i configure
{% endblock %}

{% block c_rename_symbol %}
__crashreporter_info__
{% if linux %}
reallocf
{% endif %}
{% endblock %}

{% block c_flags %}
-iquote${PWD}/ld64/src/3rd
{% endblock %}

{% block patch %}
sed -e 's|.*Blob.*clone.*||' \
    -i ld64/src/ld/code-sign-blobs/blob.h

cat << EOF > libobjc2/Makefile.am
noinst_LTLIBRARIES = libobjc.la
libobjc_la_LDFLAGS =
libobjc_la_SOURCES =
EOF

cat << EOF > ld64/src/3rd/BlocksRuntime/Makefile.am
noinst_LTLIBRARIES = libBlocksRuntime.la
noinst_HEADERS =
libBlocksRuntime_la_SOURCES =
EOF
{% endblock %}

{% block configure_flags %}
{% if darwin %}
--with-sysroot=${OSX_SDK}
{% endif %}
{% endblock %}

{% block setup_target_flags %}
{% if linux %}
export CTRFLAGS="-I${BSD_HEADERS} ${CTRFLAGS}"
{% endif %}
{% endblock %}
