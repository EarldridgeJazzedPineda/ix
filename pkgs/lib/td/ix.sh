{% extends '//die/c/cmake.sh' %}

{% block version %}
1.8.0
{% endblock %}

{% block fetch %}
https://github.com/tdlib/td/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:30d560205fe82fb811cd57a8fcbc7ac853a5b6195e9cb9e6ff142f5e2d8be217
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/openssl
{% endblock %}

{% block bld_libs %}
lib/kernel
lib/readline
{% endblock %}

{% block bld_tool %}
bin/gperf
bld/fakegit
{% endblock %}

{% block patch %}
>test/CMakeLists.txt
{% endblock %}
