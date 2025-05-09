{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
lib/lunasvg
lib/gdk/pixbuf/unwrap
{% endblock %}

{% block cpp_defines %}
GDK_PIXBUF_ENABLE_BACKEND=1
{% endblock %}

{% block setup_target_flags %}
export CXXFLAGS="-Wno-writable-strings ${CXXFLAGS}"
{% endblock %}

{% block sources %}
io.cpp
{% endblock %}
