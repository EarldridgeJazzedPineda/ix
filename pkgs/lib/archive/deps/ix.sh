{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/b2
{% if freebsd %}
lib/md
{% endif %}
lib/xz
lib/lz4
lib/lzo
lib/zstd
lib/iconv
lib/expat
lib/bzip/2
{% endblock %}
