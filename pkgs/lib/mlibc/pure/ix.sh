{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
mlibc
{% endblock %}

{% block version %}
3.0.0-rc2
{% endblock %}

{% block fetch %}
https://github.com/managarm/mlibc/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:9d9acd6f87bf7ef3d7418e4a3fedeed616a8bb287e48d37e6e773e7cf3c17255
{% endblock %}

{% block lib_deps %}
lib/kernel
{% endblock %}

{% block bld_libs %}
lib/mlibc/frigg
lib/mlibc/cxxshim
lib/build/w/include/next
{% endblock %}

{% block patch %}
sed -e 's|.*include_dir.*ccdir.*||' -i meson.build
cat - options/ansi/include/limits.h << EOF > _
#pragma once
#include_next <limits.h>
#undef CHAR_BIT
#undef LLONG_MIN
EOF
mv _ options/ansi/include/limits.h
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
cat - include/sys/mman.h << EOF > _
#include <mlibc-config.h>
EOF
mv _ include/sys/mman.h
cd lib
ar q libcrt.a crt1.o crti.o crtn.o
ranlib libcrt.a
rm *.o
{% endblock %}

{% block env %}
export CMFLAGS="-DLIBCXX_ENABLE_LOCALIZATION=OFF \${CMFLAGS}"
export CPPFLAGS="-fno-pic -fno-pie -isystem ${out}/include \${CPPFLAGS}"
export LDFLAGS="-static \${LDFLAGS}"
{% endblock %}
