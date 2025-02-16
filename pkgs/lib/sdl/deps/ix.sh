{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/dbus/dl
lib/drivers/3d
{% if mesa_driver %}
lib/mesa/gl/dl
lib/mesa/egl/dl
lib/mesa/glesv2/dl
{% endif %}
{% endif %}
{% endblock %}
