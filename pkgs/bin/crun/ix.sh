{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
https://github.com/containers/crun
{% endblock %}

{% block git_branch %}
1.18
{% endblock %}

{% block git_sha %}
56c113a628729fcd3102fcc25417c22e7a7fe2c15a570dd69ae8643ba7addf6e
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/intl
lib/yajl
lib/seccomp
lib/argp/standalone
{% endblock %}

{% block bld_tool %}
bin/gperf
bld/python
bld/fakegit
{% endblock %}

{% block configure_flags %}
--disable-dl
--disable-systemd
--disable-embedded-yajl
{% endblock %}

{% block build %}
cat << EOF > git-version.h
#pragma once
#define GIT_VERSION "{{self.git_branch().strip()}}"
EOF
{{super()}}
{% endblock %}
