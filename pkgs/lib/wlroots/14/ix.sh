{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wlroots
{% endblock %}

{% block version %}
0.14.1
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/{{self.version().strip()}}/wlroots-{{self.version().strip()}}.tar.bz2
md5:7c8a3246e7ddb724bf7397a2f8f9b782
{% endblock %}

{% block lib_deps %}
lib/c
lib/drm
lib/gbm
lib/udev
lib/seat
lib/input
lib/pixman
lib/wayland
lib/xkb/common
{% if opengl %}
lib/opengl
{% endif %}
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block wlr_renderers %}
{% if opengl %}
gles2
{% endif %}
{% if vulkan %}
vulkan
{% endif %}
{% endblock %}

{% block meson_flags %}
xwayland=disabled
renderers={{self.renderers().strip().replace('\n', ',')}}
{% endblock %}

{% block c_rename_symbol %}
NSEC_PER_SEC
{% endblock %}

{% block patch %}
>xcursor/xcursor.c
{% endblock %}

{% block cpp_defines %}
XcursorImagesDestroy=xcursor_images_destroy
{% endblock %}
