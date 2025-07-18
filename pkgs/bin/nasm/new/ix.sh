{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nasm
{% endblock %}

{% block version %}
2.16.03
{% endblock %}

{% block fetch %}
https://github.com/netwide-assembler/nasm/archive/refs/tags/nasm-{{self.version().strip()}}.tar.gz
e525fa6fdc3df33cec6b499111f44afa78ce50bf260158580dcf014015a21ba9
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block build %}
{{super()}}
>nasm.1
>ndisasm.1
{% endblock %}
