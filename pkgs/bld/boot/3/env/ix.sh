{% extends '//die/hub.sh' %}

{% block ind_deps %}
bld/boot/3/lib/c
{% endblock %}

{% block run_deps %}
bld/boot/3/bt
bld/boot/3/shim
bld/boot/3/sh/1
bld/boot/3/cc
bld/boot/3/make/1
bld/boot/2/env
{% endblock %}
