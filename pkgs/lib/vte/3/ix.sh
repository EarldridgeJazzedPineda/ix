{% extends '//lib/vte/t/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/gtk/3
{% endblock %}

{% block meson_flags %}
{{super()}}
gtk3=true
gtk4=false
{% endblock %}

{% block env %}
{{super()}}
export CPPFLAGS="-I${out}/include/vte-2.91 \${CPPFLAGS}"
{% endblock %}
