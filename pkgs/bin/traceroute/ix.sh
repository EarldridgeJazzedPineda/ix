{% extends '//die/c/make.sh' %}

{% block version %}
2.1.1
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/traceroute/traceroute/traceroute-{{self.version().strip()}}/traceroute-{{self.version().strip()}}.tar.gz
sha:8fc8d5046e855d7588607bb319f5b82e3ba13e91d5d4636863262e6386bbaf76
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block patch %}
sed -e 's|-lm||' -i Make.rules
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_flags %}
CC=clang
CXX=clang++
{% endblock %}
