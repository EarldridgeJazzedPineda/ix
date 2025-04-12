{% extends '//die/c/autorehell.sh' %}

{% block version %}
3.6.6
{% endblock %}

{% block fetch %}
https://github.com/sass/libsass/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:11f0bb3709a4f20285507419d7618f3877a425c0131ea8df40fe6196129df15d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
