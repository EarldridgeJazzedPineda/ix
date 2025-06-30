{% extends '//die/c/make.sh' %}

{% block lib_deps %}
lib/c
{% if mingw32 %}
lib/shim/dll(dll_name=advapi32)
lib/shim/dll(dll_name=user32)
lib/shim/dll(dll_name=crypt32)
{% endif %}
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/perl
{% if mingw32 %}
bld/windres(for_target={{target.gnu.three}})
{% endif %}
{% endblock %}

{% block setup_target_flags %}
export AR=ar
export RANLIB=ranlib
# fix unknown miscompile with clang
export CFLAGS="${CFLAGS} -O1"
{% endblock %}

{% block make_install_target %}
install_sw
{% endblock %}

{% block configure %}
{% set openssl_conf_opts %}
{% block openssl_conf_opts %}
{% endblock %}

no-asm
threads
no-shared
no-dso
no-tests

--prefix="${out}"
--openssldir=/etc/ssl
{% endset %}

{% block openssl_platforms %}
PLATFORM_darwin_arm64="darwin64-arm64-cc"
PLATFORM_darwin_x86_64="darwin64-x86_64-cc"
PLATFORM_linux_x86_64="linux-x86_64-clang"
PLATFORM_linux_aarch64="linux-aarch64"
PLATFORM_linux_riscv64="linux64-riscv64"
{% if mingw32 %}
PLATFORM_mingw32_x86_64="mingw64"
{% endif %}
{% if freebsd %}
PLATFORM_freebsd_x86_64="BSD-x86_64"
{% endif %}
{% if armv7 %}
PLATFORM_linux_armv7="linux-generic32"
{% endif %}
{% endblock %}

perl ./Configure \
    ${PLATFORM_{{target.os}}_{{target.arch}}} \
    {{ix.fix_list(openssl_conf_opts)}}
{% endblock %}

{% block env %}
{{super()}}
{% if lib %}
export SSL_DIR="${out}"
export COFLAGS="--with-ssl=${out} --with-openssl=${out} --with-openssldir=${out} --with-ssl-dir=$out \${COFLAGS}"
{% endif %}
{% endblock %}
