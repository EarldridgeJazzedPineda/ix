{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if std_box %}
lib/ffi/boot
{% elif mingw32 %}
lib/ffi/mingw
{% elif darwin %}
lib/ffi/darwin
{% else %}
lib/ffi/unix
{% endif %}
{% endblock %}
