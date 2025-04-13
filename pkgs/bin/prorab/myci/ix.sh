{% extends '//die/c/make.sh' %}

{% block pkg_name %}
myci
{% endblock %}

{% block version %}
0.1.147
{% endblock %}

{% block fetch %}
https://github.com/cppfw/myci/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:1ab8a33005130b84ca7b7f4a7faca7540cff2a02421e06631c1d3c8893fde334
{% endblock %}

{% block bld_tool %}
bin/prorab/base
bin/prorab/extra
{% endblock %}

{% block make_flags %}
-I ${PRORAB_DIR}
-I ${PRORAB_EXTRA_DIR}
{% endblock %}

{% block build_flags %}
fix_shebangs
{% endblock %}
