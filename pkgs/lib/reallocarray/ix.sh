{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/c/naked
lib/reallocarray/headers
lib/build/w/include/next
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="-fno-builtin ${CFLAGS}"
{% endblock %}

{% block sources %}
reallocarray.cpp
{% endblock %}

{% block env %}
export ac_cv_func_reallocarray=yes
{% endblock %}
