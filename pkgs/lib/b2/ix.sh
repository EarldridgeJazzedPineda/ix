{% extends '//die/c/autorehell.sh' %}

{% block version %}
0.98.1
{% endblock %}

{% block fetch %}
https://github.com/BLAKE2/libb2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:10053dbc2fa342516b780a6bbf6e7b2a2360b8d49c5ac426936bf3df82526732
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-native
{% if x86_64 %}
--enable-fat
{% else %}
--disable-fat
{% endif %}
{% endblock %}

{% block configure %}
{% if aarch64 %}
# https://github.com/BLAKE2/libb2/blob/master/configure.ac#L87
export ax_cv_have_ssse3_ext=no
{% endif %}
{{super()}}
{% endblock %}
