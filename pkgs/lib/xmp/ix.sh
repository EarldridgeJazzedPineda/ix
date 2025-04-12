{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libxmp
{% endblock %}

{% block version %}
4.6.0
{% endblock %}

{% block fetch %}
https://github.com/libxmp/libxmp/archive/refs/tags/libxmp-{{self.version().strip()}}.tar.gz
sha:032ed31e9a334078e59dc5e2ca7a14b950712fef8e838328b727570ddbd3dc12
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
