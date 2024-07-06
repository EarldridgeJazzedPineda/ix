{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL/archive/refs/tags/release-2.30.5.tar.gz
sha:be3ca88f8c362704627a0bc5406edb2cd6cc6ba463596d81ebb7c2f18763d3bf
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block cmake_flags %}
LIBTYPE=STATIC
SDL_STATIC=ON
SDL_SHARED=OFF
SDL_LIBSAMPLERATE=OFF
SDL_LIBSAMPLERATE_SHARED=OFF
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="-Wno-incompatible-function-pointer-types ${CFLAGS}"
{% endblock %}

{% block patch %}
sed -e 's|define SDL_DYNAMIC_API 1|define SDL_DYNAMIC_API 0|' \
    -i src/dynapi/SDL_dynapi.h
{% endblock %}

{% block postinstall %}
{{super()}}
cd ${out}
mv lib/bin bin # or broke scummvm configure
{% endblock %}

{% block env %}
export SDL2_LIBRARY=${out}/lib/libSDL2.a
export SDL2_HEADERS=${out}/include/SDL2
{% endblock %}
