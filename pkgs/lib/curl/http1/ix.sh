{% extends '//lib/curl/t/ix.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/openssl
lib/ca/bundle
{% if darwin %}
lib/darwin/framework/SystemConfiguration
{% endif %}
{% endblock %}

{% block configure_flags %}
{{super()}}
--without-libpsl
{% endblock %}
