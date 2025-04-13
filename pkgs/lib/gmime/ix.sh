{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
gmime
{% endblock %}

{% block version %}
3.2.13
{% endblock %}

{% block fetch %}
https://github.com/jstedfast/gmime/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:1ba533e4fbc9da7059b5c5dd8b4e0b4cf60731e86fbc3d8f547b305d3e1e1471
{% endblock %}

{% block conf_ver %}2/71{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/glib
lib/idn/2
{% endblock %}

{% block bld_tool %}
bld/gtkdoc
{% endblock %}

{% block configure_flags %}
--disable-gtk-doc
--enable-introspection=no
--enable-vala=no
{% endblock %}
