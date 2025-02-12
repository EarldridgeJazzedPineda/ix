{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://storage.googleapis.com/aom-releases/libaom-3.12.0.tar.gz
sha:d89daa160a0ea1409c4193be5b17c9591024c4f5a0e545dcb9d197535c66836e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/c++
{% endblock %}

{% block bld_tool %}
bld/perl
{% if x86_64 %}
bld/nasm
{% endif %}
{% if darwin %}
bld/cctools
{% endif %}
{% endblock %}

{% block cmake_flags %}
HAVE_PTHREAD_H=1
HAVE_UNISTD_H=1
CONFIG_RUNTIME_CPU_DETECT=1
AOM_ARCH_{{target.gnu_arch.upper()}}=1
AOM_TARGET_CPU={{target.arch}}
ENABLE_WERROR=OFF
ENABLE_TESTS=OFF
ENABLE_DOCS=OFF
{% if x86_64 %}
AOM_ARCH_X86=1
ENABLE_MMX=ON
ENABLE_SSE=ON
ENABLE_NASM=ON
ENABLE_SSE2=ON
ENABLE_SSE3=ON
ENABLE_SSSE3=ON
ENABLE_SSE4_1=ON
ENABLE_SSE4_2=ON
ARCH_X86_64=ON
HAVE_MMX=1
HAVE_SSE=1
HAVE_SSE2=1
HAVE_SSE3=1
HAVE_SSE4_1=1
HAVE_SSE4_2=1
HAVE_SSSE3=1
HAVE_AVX=1
HAVE_AVX2=2
{% endif %}
{% if aarch64 or arm64 %}
ENABLE_NEON=ON
ARCH_ARM=ON
{% else %}
ENABLE_NEON=OFF
{% endif %}
{% endblock %}
