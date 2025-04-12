{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
slurp
{% endblock %}

{% block version %}
1.5.0
{% endblock %}

{% block fetch %}
https://github.com/emersion/slurp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:0fa880d4a93e1c795e3b5929fbea47546df0955bea34fc2f7ffeb1751678f663
{% endblock %}

{% block bld_libs %}
lib/c
lib/cairo
lib/kernel
lib/wayland
lib/xkb/common
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}
