{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libnotify
{% endblock %}

{% block version %}
0.8.6
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/libnotify/0.8/libnotify-{{self.version().strip()}}.tar.xz
c5540aaefb60e1d63b1c587c05f2284ebe72ece7d0c0e5e4a778cfd5844b6b58
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gdk/pixbuf
{% endblock %}

{% block meson_flags %}
man=false
tests=false
gtk_doc=false
introspection=disabled
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|-DG_LOG_DOMAIN=.*||' -e 's|-Wl,.*||' -i ${out}/lib/pkgconfig/libnotify.pc
{% endblock %}
