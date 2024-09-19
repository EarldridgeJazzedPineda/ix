{% extends '//lib/mesa/drivers/valve/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/llvm/18
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/python
bld/llvm/config
{% endblock %}

{% block meson_flags %}
{{super()}}
llvm=enabled
shared-llvm=disabled
{% endblock %}

{% block meson_cross %}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|config-tool|auto|' -i meson.build
{% endblock %}
