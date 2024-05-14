{% extends '//lib/lua/t/ix.sh' %}

{% block make_flags %}
INSTALL_TOP=${out}
LIBS="${PWD}/dl.o"
{% endblock %}

{% block lua_dlopen %}
src/loadlib.c
{% endblock %}

{% block env %}
{{super()}}
{% if lib %}
export LUA_INCLUDE_DIR="${out}/include"
export CMFLAGS="-DWITH_LUA_ENGINE=Lua \${CMFLAGS}"
{% endif %}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|.*define LUA_USE_READLINE.*||' -i src/luaconf.h
{% endblock %}
