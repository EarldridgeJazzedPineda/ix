{% extends '//die/gen.sh' %}

{% block lib_deps %}
lib/mesa
{% endblock %}

{% block env %}
export LDFLAGS="-lGLESv2 \${LDFLAGS}"
{% endblock %}
