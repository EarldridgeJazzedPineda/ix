{% extends '//die/c/meson.sh' %}

{% block lib_deps %}
lib/c
lib/epoxy
lib/opengl
lib/lcms/2
lib/glslang
lib/shaderc
lib/execinfo
lib/vulkan/loader
lib/vulkan/headers
lib/spirv/tools
lib/spirv/headers
{% endblock %}

{% block bld_libs %}
pip/Mako
{% endblock %}

{% block bld_tool %}
bld/python
bin/glslang
{% endblock %}

{% block meson_flags %}
vulkan=enabled
opengl=enabled
vulkan-registry="${VK_XML}"
{% endblock %}
