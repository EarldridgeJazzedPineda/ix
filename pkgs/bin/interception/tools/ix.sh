{% extends '//die/c/cmake.sh' %}

{% block version %}
0.6.8
{% endblock %}

{% block fetch %}
https://gitlab.com/interception/linux/tools/-/archive/v{{self.version().strip()}}/tools-v{{self.version().strip()}}.tar.bz2
sha:45527d9430c2d29f9dce9403d2f8d76f393fe156c8736d618166388169d4268d
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/udev
lib/evdev
lib/boost
lib/kernel
lib/yaml/cpp
{% endblock %}
