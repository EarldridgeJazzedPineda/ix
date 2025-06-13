{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
chmlib
{% endblock %}

{% block version %}
0.40
{% endblock %}

{% block fetch %}
http://www.jedrea.com/chmlib/chmlib-{{self.version().strip()}}.tar.bz2
3449d64b0cf71578b2c7e3ddc048d4af3661f44a83941ea074a7813f3a59ffa3
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block cpp_defines %}
pread64=pread
{% endblock %}
