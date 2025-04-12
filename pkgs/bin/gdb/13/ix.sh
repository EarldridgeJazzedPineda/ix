{% extends '//bin/gdb/14/ix.sh' %}

{% block pkg_name %}
gdb
{% endblock %}

{% block version %}
13.2
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/gdb/gdb-{{self.version().strip()}}.tar.xz
sha:fd5bebb7be1833abdb6e023c2f498a354498281df9d05523d8915babeb893f0a
{% endblock %}
