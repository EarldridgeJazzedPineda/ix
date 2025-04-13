{% extends '//die/c/autorehell.sh' %}

{% block version %}
16.04.0
{% endblock %}

{% block fetch %}
https://launchpad.net/libdbusmenu/16.04/{{self.version().strip()}}/+download/libdbusmenu-{{self.version().strip()}}.tar.gz
sha:b9cc4a2acd74509435892823607d966d424bd9ad5d0b00938f27240a1bfa878a
{% endblock %}

{% block lib_deps %}
lib/c
lib/atk
lib/glib
lib/dbus
lib/gtk/3
lib/json/glib
{% endblock %}

{% block bld_tool %}
bld/python
bld/gettext
bld/intltool
bld/glib
{% endblock %}

{% block configure_flags %}
--with-gtk=3
--disable-vala
--disable-dumper
--enable-dumper=no
{% endblock %}

{% block install %}
{{super()}}
find ${out}/ -name '*.pc' | while read l; do
    sed -e 's|.*bindir.*||' -i ${l}
done
{% endblock %}
