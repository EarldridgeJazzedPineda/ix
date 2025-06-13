{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libbsd
{% endblock %}

{% block version %}
0.12.2
{% endblock %}

{% block fetch %}
https://libbsd.freedesktop.org/releases/libbsd-{{self.version().strip()}}.tar.xz
b88cc9163d0c652aaf39a99991d974ddba1c3a9711db8f1b5838af2a14731014
{% endblock %}

{% block bld_tool %}
bld/auto
{% endblock %}

{% block setup_target_flags %}
export CPPFLAGS="-I.. -isystem ../include/bsd ${CPPFLAGS}"
{% endblock %}
