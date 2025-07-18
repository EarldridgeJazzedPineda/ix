{% extends '//die/c/make.sh' %}

{% block pkg_name %}
schedtool
{% endblock %}

{% block version %}
1.3.0
{% endblock %}

{% block fetch %}
https://github.com/freequaos/schedtool/archive/refs/tags/schedtool-{{self.version().strip()}}.tar.gz
6c3388771849c96c4c3d4405096a3e147709ff48eb5f53adb8354735cf110500
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block make_flags %}
DESTDIR=${out}
DESTPREFIX=/
{% endblock %}

{% block bld_tool %}
bld/gzip
{% endblock %}
