{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/fusermount/3
bin/s3/baker/unwrap
{% endblock %}
