{% extends '//bin/sbcl/t/ix.sh' %}

{% block fetch %}
https://nav.dl.sourceforge.net/project/sbcl/sbcl/2.2.1/sbcl-2.2.1-source.tar.bz2
5dd6e6e3f08b7c6edf262a0e844a9f8b5e562cca08155034c1f2c014fc9087da
{% endblock %}

{% block bld_tool %}
bin/ecl
{{super()}}
{% endblock %}

{% block boot_lisp %}
ecl -norc
{% endblock %}

{% block patch %}
{{super()}}
base64 -d << EOF | patch src/runtime/gencgc.c
{% include '0.diff/base64' %}
EOF
{% endblock %}
