{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/fake(tool_name=texinfo)
bld/fake(tool_name=makeinfo)
{% endblock %}
