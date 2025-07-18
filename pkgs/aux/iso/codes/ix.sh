{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
iso-codes
{% endblock %}

{% block version %}
4.18.0
{% endblock %}

{% block fetch %}
https://salsa.debian.org/iso-codes-team/iso-codes/-/archive/v{{self.version().strip()}}/iso-codes-v{{self.version().strip()}}.tar.gz
511f67bf4b51aa77f17c45adbff533242b50f1e370fe49a5706b6341902fac87
{% endblock %}

{% block bld_tool %}
bld/python
bld/gettext
{% endblock %}

{% block strip_pc %}
:
{% endblock %}

{% block env %}
export ISO_CODES=${out}
{% endblock %}
