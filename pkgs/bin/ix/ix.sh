{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/bsdtar
bin/ix/confine
bin/ix/fetcher
bin/ix/assemble
bin/python/frozen
{% endblock %}
