{% extends '//die/c/autorehell.sh' %}

{% block version %}
9.0.0006
{% endblock %}

{% block fetch %}
https://github.com/vim/vim/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:e5ece8e5b530561a5ab732c793e7e247f3c472bce57b09cead3b58f2d4f9b3f4
{% endblock %}

{% block unpack %}
{{super()}}
cd src
{% endblock %}

{% block autoreconf %}
autoconf
{% endblock %}

{% block bld_libs %}
lib/c
lib/acl
lib/curses
{% endblock %}

{% block configure_flags %}
--with-features=huge
--with-compiledby='MIX'
--enable-acl
--disable-gui
--enable-multibyte
--enable-cscope
{% endblock %}
