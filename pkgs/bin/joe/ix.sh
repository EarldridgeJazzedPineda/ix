{% extends '//die/c/autorehell.sh' %}

{% block version %}
4.6
{% endblock %}

{% block fetch %}
https://sourceforge.net/projects/joe-editor/files/JOE%20sources/joe-{{self.version().strip()}}/joe-{{self.version().strip()}}.tar.gz
sha:495a0a61f26404070fe8a719d80406dc7f337623788e445b92a9f6de512ab9de
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE=1
{% endblock %}
