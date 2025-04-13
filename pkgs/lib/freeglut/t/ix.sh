{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
freeglut
{% endblock %}

{% block version %}
3.4.0
{% endblock %}

{% block fetch %}
https://github.com/FreeGLUTProject/freeglut/releases/download/v{{self.version().strip()}}/freeglut-{{self.version().strip()}}.tar.gz
sha:3c0bcb915d9b180a97edaebd011b7a1de54583a838644dcd42bb0ea0c6f3eaec
{% endblock %}

{% block lib_deps %}
lib/c
lib/opengl
lib/wayland
lib/xkb/common
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block cmake_flags %}
FREEGLUT_GLES=ON
FREEGLUT_WAYLAND=ON
FREEGLUT_BUILD_SHARED_LIBS=OFF
{% endblock %}

{% block cpp_missing %}
GL/gl.h
{% endblock %}
