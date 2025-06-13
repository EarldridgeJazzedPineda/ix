{% extends '//die/c/make.sh' %}

{% block pkg_name %}
bzip2
{% endblock %}

{% block version %}
1.0.8
{% endblock %}

{% block fetch %}
https://sourceware.org/pub/bzip2/bzip2-{{self.version().strip()}}.tar.gz
ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block make_target %}
bzip2
bzip2recover
{% endblock %}
