{% extends '//die/c/make.sh' %}

{% block version %}
1.0.0
{% endblock %}

{% block fetch %}
https://git.sr.ht/~sircmpwn/wev/archive/{{self.version().strip()}}.tar.gz
sha:613a1df1a4879d50ce72023de14aaf05be2e6f51346e84a69f50fc6d8502bbf4
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/wayland
lib/xkb/common
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/pkg/config
bld/wayland
{% endblock %}
