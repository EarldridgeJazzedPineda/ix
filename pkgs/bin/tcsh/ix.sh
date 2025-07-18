{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
tcsh
{% endblock %}

{% block version %}
6.24.15
{% endblock %}

{% block fetch %}
https://astron.com/pub/tcsh/tcsh-{{self.version().strip()}}.tar.gz
d4d0b2a4df320f57a518e44c359ef36bbcf85d64f5146d0cb8ff34984e0d23fd
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
lib/curses
{% endblock %}
