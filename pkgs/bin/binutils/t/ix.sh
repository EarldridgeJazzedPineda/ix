{% extends '//die/c/autohell.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block configure_flags %}
--disable-plugins
--disable-werror
--with-system-zlib
--enable-deterministic-archives
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|../.*/lib.*\.a||g' \
    -e 's|../.*/lib.*\.la||g' \
    -i Makefile
{% endblock %}

{% block make_flags %}
tooldir=${out}
{% endblock %}
