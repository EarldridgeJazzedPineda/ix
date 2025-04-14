{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
lame
{% endblock %}

{% block version %}
3.100
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/lame/lame/{{self.version().strip()}}/lame-{{self.version().strip()}}.tar.gz
sha:ddfe36cab873794038ae2c1210557ad34857a4b6bdc515785d1da9e175b1da1e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/nasm
bld/gettext
{% endblock %}

{% block configure_flags %}
--enable-nasm
{% endblock %}
