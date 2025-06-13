{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
freeglut
{% endblock %}

{% block version %}
3.6.0
{% endblock %}

{% block fetch %}
https://github.com/FreeGLUTProject/freeglut/releases/download/v{{self.version().strip()}}/freeglut-{{self.version().strip()}}.tar.gz
9c3d4d6516fbfa0280edc93c77698fb7303e443c1aaaf37d269e3288a6c3ea52
{% endblock %}

{% block lib_deps %}
lib/c
lib/opengl
lib/wayland
lib/xkb/common
{% endblock %}

{% block bld_libs %}
lib/kernel
lib/shim/fake(lib_name=GLESv1_CM)
lib/shim/fake(lib_name=OpenGL)
{% endblock %}

{% block cmake_flags %}
FREEGLUT_GLES=ON
FREEGLUT_WAYLAND=ON
FREEGLUT_BUILD_SHARED_LIBS=OFF
{% endblock %}

{% block cpp_missing %}
GL/gl.h
{% endblock %}
