{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/musl
bld/cargo/linux/unwrap
{% endblock %}
