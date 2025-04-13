{% extends '//die/c/make.sh' %}

{% block pkg_name %}
pcg-cpp
{% endblock %}

{% block version %}
0.98.1
{% endblock %}

{% block fetch %}
https://github.com/imneme/pcg-cpp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:25bb22f076e8c346fa28c2267ae3564b12122f1f4ab2d2a08ad8909dcd6319fd
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block patch %}
sed -e 's|install: all|install:|' \
    -e 's|$PREFIX|$(PREFIX)|'\
    -i Makefile
{% endblock %}

{% block build %}
:
{% endblock %}

{% block install %}
mkdir ${out}/include
{{super()}}
{% endblock %}
