{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libmt32emu
{% endblock %}

{% block version %}
2.7.1
{% endblock %}

{% block fetch %}
https://github.com/munt/munt/archive/refs/tags/libmt32emu_{{self.version().strip().replace('.', '_')}}.tar.gz
sha:e4524d52d6799a4e32a961a2e92074f14adcb2f110a4e7a06bede77050cfdaf4
{% endblock %}

{% block step_unpack %}
{{super()}}
cd mt32emu
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
