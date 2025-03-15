{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/shepherd
bin/webkitproc
bin/epiphany/{{gtk_ver}}(allocator={{default_allocator}})
bin/xdg/er/webkit(wrap=epiphany,prefix=shepherd)
{% endblock %}
