{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libcroco
{% endblock %}

{% block version %}
0.6.12
{% endblock %}

{% block fetch %}
http://ftp.gnome.org/pub/gnome/sources/libcroco/0.6/libcroco-{{self.version().strip()}}.tar.xz
sha:ddc4b5546c9fb4280a5017e2707fbd4839034ed1aba5b7d4372212f34f84f860
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/xml/2
{% endblock %}

{% block bld_tool %}
bld/gtkdoc
{% endblock %}
