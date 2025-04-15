{% extends '//die/c/make.sh' %}

{% block version %}
2022-03-08-v2
{% endblock %}

{% block pkg_name %}
ndhc
{% endblock %}

{% block fetch %}
https://github.com/niklata/ndhc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:24892e29ce27a57dfff8dc3a854da64220dee4ac770dd3f94a2866b4601b57a5
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/kernel
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ndhc ${out}/bin/
{% endblock %}
