{% extends '//die/c/autohell.sh' %}

{% include '//bin/binutils/t/ver.sh' %}

{% block unpack %}
{{super()}}
cd opcodes
{% endblock %}

{% block lib_deps %}
lib/c
lib/bfd
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block configure_flags %}
--enable-targets=all
--enable-install-libbfd
{% endblock %}

{% block patch %}
echo 0 > ../bfd/libtool-soversion
{% endblock %}
