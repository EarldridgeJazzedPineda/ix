{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
https://chromium.googlesource.com/chromiumos/third_party/adhd
{% endblock %}

{% block git_commit %}
d4de233e76946e91fab6c879717d53da62d94f57
{% endblock %}

{% block git_sha %}
627b64f7a39e35c84c9dd2f154873023949b22a6a1f69ff1f6862803ef5c7adf
{% endblock %}

{% block git_refine %}
find . -type l -delete
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/sbc
lib/alsa
lib/dbus
lib/udev
lib/kernel
lib/curses
lib/sndfile
# ieee754.h
lib/shim/gnu
lib/ini/parser
lib/ladspa/sdk
lib/google/test
lib/bsd/overlay
lib/xiph/speex/dsp
{% endblock %}

{% block configure_flags %}
--disable-alsa-plugin
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE=1
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block bld_tool %}
bin/xxd
bld/fakegit
bld/fake(tool_name=rustc)
bld/fake(tool_name=cargo)
{% endblock %}

{% block cpp_missing %}
string.h
stdlib.h
sys/types.h
{% endblock %}

{% block configure %}
{{super()}}
find . -type f -name Makefile | while read l; do
    sed -e 's|\$.*libcras_rust.a||' -i ${l}
done
{% endblock %}

{% block step_unpack %}
{{super()}}
cd cras
{% endblock %}

{% block patch %}
base64 -d << EOF > src/server/rate_estimator.h
{% include 'rate_estimator.h/base64' %}
EOF
base64 -d << EOF > src/server/rate_estimator.c
{% include 'rate_estimator.c/base64' %}
EOF
cat src/server/rate_estimator.c >> src/server/linear_resampler.c
{% endblock %}
