{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
sed
{% endblock %}

{% block version %}
4.9
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/sed/sed-{{self.version().strip()}}.tar.xz
6e226b732e1cd739464ad6862bd1a1aba42d7982922da7a53519631d24975181
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% if mingw32 %}
lib/shim/dll(dll_name=bcrypt)
{% endif %}
{% endblock %}
