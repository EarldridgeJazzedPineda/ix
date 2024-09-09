{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ivmai/bdwgc/archive/refs/tags/v8.2.8.tar.gz
sha:f8f85e2ad675375df37916826c70f80630b7cc4d3ae33c4447a72640641d224f
{% endblock %}

{% block lib_deps %}
lib/c
lib/atomic/ops
{% if darwin %}
lib/darwin/framework/CoreFoundation
{% endif %}
{% endblock %}

{% block env %}
export COFLAGS="--with-libgc-prefix=${out} \${COFLAGS}"
{% endblock %}

{% block patch %}
sed -e 's|REAL_DLFUNC(dlopen)|stub_dlopen|' -i gc_dlopen.c
{% endblock %}

{% block cmake_flags %}
HAVE_GETCONTEXT=OFF
build_tests=OFF
enable_docs=OFF
enable_threads=ON
enable_large_config=ON
enable_dynamic_loading=OFF
with_libatomic_ops=ON
{% endblock %}
