{% extends '//die/c/make.sh' %}

{% block pkg_name %}
perl:Parse-Yapp
{% endblock %}

{% block version %}
1.21
{% endblock %}

{% block fetch %}
https://cpan.metacpan.org/authors/id/W/WB/WBRASWELL/Parse-Yapp-{{self.version().strip()}}.tar.gz
3810e998308fba2e0f4f26043035032b027ce51ce5c8a52a8b8e340ca65f13e5
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block configure %}
perl Makefile.PL INSTALL_BASE=${out}
{% endblock %}

{% block env %}
export PERL5LIB="${out}/lib/perl5"
{% endblock %}

{% block postinstall %}
echo 'TODO(pg): check me'
{% endblock %}
