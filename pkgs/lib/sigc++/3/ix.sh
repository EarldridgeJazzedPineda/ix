{% extends '//die/c/meson.sh' %}

# noauto

{% block pkg_name %}
libsigc++
{% endblock %}

{% block version %}
3.4.0
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/libsigc++/3.4/libsigc%2B%2B-{{self.version().strip()}}.tar.xz
sha:02e2630ffb5ce93cd52c38423521dfe7063328863a6e96d41d765a6116b8707e
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
