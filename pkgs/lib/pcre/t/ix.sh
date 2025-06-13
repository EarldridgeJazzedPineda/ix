{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
pcre
{% endblock %}

{% block version %}
8.45
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/pcre/pcre/{{self.version().strip()}}/pcre-{{self.version().strip()}}.tar.bz2
4dae6fdcd2bb0bb6c37b5f97c33c2be954da743985369cddac3546e3218bffb8
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
PCRE_BUILD_PCRE16=ON
PCRE_BUILD_PCRE32=ON
PCRE_BUILD_PCRECPP=OFF
{% if wasm32 or wasm64 %}
PCRE_SUPPORT_JIT=OFF
PCRE_SUPPORT_PCREGREP_JIT=OFF
{% else %}
PCRE_SUPPORT_JIT=ON
PCRE_SUPPORT_PCREGREP_JIT=ON
{% endif %}
PCRE_SUPPORT_UNICODE_PROPERTIES=ON
{% endblock %}
