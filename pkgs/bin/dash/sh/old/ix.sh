{% extends '//bin/dash/sh/ix.sh' %}

{% block pkg_name %}
dash
{% endblock %}

{% block version %}
0.5.11.3
{% endblock %}

{% block fetch %}
http://gondor.apana.org.au/~herbert/dash/files/dash-{{self.version().strip()}}.tar.gz
62b9f1676ba6a7e8eaec541a39ea037b325253240d1f378c72360baa1cbcbc2a
{% endblock %}
