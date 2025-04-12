{% extends '//die/c/make.sh' %}

{% block version %}
0.8
{% endblock %}

{% block fetch %}
https://github.com/martanne/vis/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:61b10d40f15c4db2ce16e9acf291dbb762da4cbccf0cf2a80b28d9ac998a39bd
{% endblock %}

{% block bld_libs %}
lib/c
lib/lua
lib/curses
lib/termkey
lib/lua/modules/lpeg
lib/lua/modules/lpeg/dl
{% endblock %}

{% block configure %}
sh ./configure \
    --prefix=${out} \
    --enable-curses \
    --enable-lua
{% endblock %}
