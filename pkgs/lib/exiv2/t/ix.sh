{% extends '//die/c/cmake.sh' %}

{% block fetch %}
#https://github.com/Exiv2/exiv2/archive/refs/tags/v0.28.0.tar.gz
#sha:04c0675caf4338bb96cd09982f1246d588bcbfe8648c0f5a30b56c7c496f1a0b
https://github.com/Exiv2/exiv2/archive/refs/tags/v0.28.2.tar.gz
sha:543bead934135f20f438e0b6d8858c55c5fcb7ff80f5d1d55489965f1aad58b9
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/expat
lib/brotli
{% endblock %}

{% block cmake_flags %}
EXIV2_ENABLE_INIH=OFF
EXIV2_ENABLE_BMFF=ON
EXIV2_BUILD_SAMPLES=OFF
EXIV2_ENABLE_DYNAMIC_RUNTIME=OFF
EXIV2_TEAM_WARNINGS_AS_ERRORS=OFF
{% endblock %}
