{% extends '//die/c/autohell.sh' %}

{% include '//bin/binutils/t/ver.sh' %}

{% block unpack %}
{{super()}}
cd libctf
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/texinfo
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
sed -e 's|../bfd/libbfd.la||g' -i Makefile.in
sed -e 's|\\${SHELL}|sh|' -i configure
{% endblock %}
