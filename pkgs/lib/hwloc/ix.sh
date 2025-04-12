{% extends '//die/c/autorehell.sh' %}

{% block version %}
2.9.0
{% endblock %}

{% block fetch %}
https://download.open-mpi.org/release/hwloc/v2.9/hwloc-{{self.version().strip()}}.tar.bz2
sha:2070e963596a2421b9af8eca43bdec113ee1107aaf7ccb475d4d3767a8856887
{% endblock %}

{% block lib_deps %}
lib/c
lib/pci/utils
lib/pci/access
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
