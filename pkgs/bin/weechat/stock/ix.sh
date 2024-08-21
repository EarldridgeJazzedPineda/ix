{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/weechat/weechat/archive/refs/tags/v4.4.1.tar.gz
sha:3426c856425614d3737e152fc4e79f61b944563cb27988e28f6d81b6396293b6
{% endblock %}

{% block bld_libs %}
lib/c
lib/lua
lib/intl
lib/curl
lib/gcrypt
lib/gnutls
lib/c/json
lib/enchant
lib/shim/fake/pkg(pkg_name=lua,pkg_ver=5.4)
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block cmake_flags %}
ENABLE_NLS=OFF
ENABLE_PERL=OFF
ENABLE_PYTHON=OFF
ENABLE_RUBY=OFF
ENABLE_TCL=OFF
ENABLE_GUILE=OFF
ENABLE_PHP=OFF
ENABLE_ENCHANT=ON
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
