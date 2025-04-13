{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
adwaita-icon-theme
{% endblock %}

{% block version %}
48.0
{% endblock %}

{% block fetch %}
https://github.com/GNOME/adwaita-icon-theme/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:6d9bdd482f94209e7c440c5203a60012854f37a8c78bfae9c6e4744a27e59188
{% endblock %}

{% block bld_tool %}
bld/gnome
{% endblock %}

{% block strip_pc %}
echo 'TODO(pg): check it'
{% endblock %}
