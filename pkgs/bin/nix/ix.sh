{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/NixOS/nix/archive/refs/tags/2.23.3.tar.gz
sha:1298570f8d905eff46049814c7c656c98c809e07407b0c5aac89c0a20cc052f2
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/curl
lib/git/2
lib/cpuid
lib/boost
lib/kernel
lib/brotli
lib/sodium
lib/bzip/2
lib/lowdown
lib/seccomp
lib/openssl
lib/archive
lib/editline
lib/sqlite/3
lib/rapidcheck
lib/google/test
lib/boehmgc/c++
lib/bsd/overlay
lib/json/nlohmann
{% endblock %}

{% block bld_tool %}
bin/jq
bld/bash
bld/flex
bld/bison
bin/lowdown
bld/auto/archive
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block configure_flags %}
--disable-doc-gen
--disable-unit-tests
--disable-functional-tests
{% endblock %}

{% block setup_target_flags %}
# https://github.com/NixOS/nix/pull/9997/commits/64cbd4c05a413eae55cde784594472f921fc7367
export OPTFLAGS="${OPTFLAGS} -UNDEBUG"
{% endblock %}
