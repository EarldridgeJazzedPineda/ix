{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v3.0.2/SVT-AV1-v3.0.2.tar.bz2
sha:7548a380cd58a46998ab4f1a02901ef72c37a7c6317c930cde5df2e6349e437b
{% endblock %}

{% block lib_deps %}
lib/c
lib/cpu/info
{% endblock %}

{% block bld_tool %}
{% if x86_64 %}
bld/nasm
{% endif %}
{% if darwin %}
bld/cctools
{% endif %}
{% endblock %}

{% block cmake_flags %}
USE_CPUINFO=SYSTEM
{% if x86_64 %}
ENABLE_NASM=ON
{% endif %}
REPRODUCIBLE_BUILDS=ON
{% endblock %}

{% block setup_target_flags %}
{% if mingw32 %}
export CFLAGS="-msse4.1 -mavx -mavx2 ${CFLAGS}"
{% endif %}
{% endblock  %}
