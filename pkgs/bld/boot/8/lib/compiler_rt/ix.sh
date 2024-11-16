{% extends '//lib/compiler_rt/builtins/hack/ix.sh' %}

{% block bld_libs %}
bld/boot/8/lib/cxx/unwind
{% endblock %}

{% block lib_deps %}
{% endblock %}

{% block bld_deps %}
bld/boot/6/env/std
{% endblock %}

{% block cpp_defines %}
__has_feature\(x\)=0
{% endblock %}

{% block cpp_includes %}
../clang/lib/Headers
{% endblock %}
