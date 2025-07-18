{% extends '//bin/coreutils/t/ix.sh' %}

{% block pkg_name %}
coreutils
{% endblock %}

{% block version %}
9.0
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-{{self.version().strip()}}.tar.gz
6fd4eb88a515004977fc72d7f47b40620409cc41dfaf00419fdd1be17663c434
{% endblock %}

{% block bld_tool %}
bld/perl
{{super()}}
{% endblock %}

{% block std_box %}
bld/bison
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-openssl=yes
{% endblock %}
