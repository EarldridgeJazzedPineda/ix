{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/webkitproc
bin/xdg/er/webkit(wrap=webview)
bin/webview/unwrap(gtk_ver=3,allocator={{default_allocator}})
{% endblock %}
