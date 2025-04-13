{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
menu-cache
{% endblock %}

{% block version %}
1.1.0
{% endblock %}

{% block fetch %}
https://github.com/lxde/menu-cache/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:990857aa61a2894730e3749b6bc0f905967eed0c21aa2b62a7694007bdccbe8d
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_libs %}
lib/fm/extra
{% endblock %}

{% block bld_tool %}
bld/gtkdoc
bld/intltool
{% endblock %}

{% block configure_flags %}
--disable-gtk-doc
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="-fcommon ${CFLAGS}"
{% endblock %}
