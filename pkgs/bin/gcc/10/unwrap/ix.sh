{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
gcc
{% endblock %}

{% block version %}
10.5.0
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/gcc/gcc-{{self.version().strip()}}/gcc-{{self.version().strip()}}.tar.xz
25109543fdf46f397c347b5d8b7a2c7e5694a5a51cce4b9c6e1ea8a71ca307c1
{% endblock %}

{% block bld_libs %}
lib/z
lib/c
lib/c++
lib/isl
lib/gmp
lib/mpc
lib/intl
lib/mpfr
{% endblock %}

{% set t %}{{target.gnu.three}}{% endset %}
{% set f %}{{for_target or target.gnu.three}}{% endset %}

{% block bld_tool %}
bld/tar
bld/perl
bld/flex
bld/gzip
bld/bison
bld/texinfo
bin/binutils(for_target={{t}},bin_prefix={{t}})
bin/binutils(for_target={{f}},bin_prefix={{f}})
{% endblock %}

{% block configure_flags %}
--with-system-zlib

--disable-lto
--disable-multilib
--disable-bootstrap

--enable-languages=c,c++

--disable-libgcc
--disable-libvtv
--disable-libatomic
--disable-libgomp
--disable-libquadmath
--disable-libssp
--disable-libstdcxx

--with-static-standard-libraries=yes
--with-native-system-header-dir=${out}
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{% endblock %}

{% block setup_target_flags %}
export CXXFLAGS="-Wno-register ${CXXFLAGS}"

export acx_cv_cc_gcc_supports_ada=no

export AR={{t}}ar
export AS={{t}}as
export LD={{t}}ld
export NM={{t}}nm
export OBJCOPY={{t}}objcopy
export OBJDUMP={{t}}objdump
export RANLIB={{t}}ranlib
export READELF={{t}}readelf
export STRIP={{t}}strip

export AR_FOR_TARGET={{f}}ar
export AS_FOR_TARGET={{f}}as
export LD_FOR_TARGET={{f}}ld
export NM_FOR_TARGET={{f}}nm
export OBJCOPY_FOR_TARGET={{f}}objcopy
export OBJDUMP_FOR_TARGET={{f}}objdump
export RANLIB_FOR_TARGET={{f}}ranlib
export READELF_FOR_TARGET={{f}}readelf
export STRIP_FOR_TARGET={{f}}strip
{% endblock %}

{% block setup_compiler %}
{{super()}}
# TODO(pg): provide real for-target compiler
export CC_FOR_TARGET=${CC}
export CXX_FOR_TARGET=${CXX}
{% endblock %}

{% block postinstall %}
echo 'FIXME(pg): proper(shared/) headers location'
{% endblock %}

{% block env %}
export GCC_INCLUDES="$(echo ${out}/lib/gcc/*/*/include)"
{% endblock %}
