{% extends '//die/c/autorehell.sh' %}

{% block version %}
6.3.0
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/gmp/gmp-{{self.version().strip()}}.tar.xz
sha:a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/m4
bld/perl
bld/texinfo
{% endblock %}

{% block env %}
export COFLAGS="--with-gmp=${out} --with-libgmp-prefix=${out} \${COFLAGS}"
{% endblock %}

{% block configure_flags %}
{% if darwin %}
--disable-assembly
{% endif %}
{% endblock %}
