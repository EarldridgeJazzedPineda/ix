{% extends '//die/c/make.sh' %}

{% block version %}
1.5.0
{% endblock %}

{% block fetch %}
https://github.com/tldr-pages/tldr-c-client/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:8e3f0c3f471896f8cfadbf9000aa8f2eff61fc3d76e25203ddc7640331c2a2af
{% endblock %}

{% block bld_libs %}
lib/c
lib/fts
lib/zip
lib/curl
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_flags %}
CC=clang
CXX=clang++
{% endblock %}
