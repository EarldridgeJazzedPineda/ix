{% extends '//die/c/autorehell.sh' %}

{% block version %}
2.2.3-1
{% endblock %}

{% block pkg_name %}
uget
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/urlget/uget-{{self.version().strip()}}.tar.gz
sha:11356e4242151b9014fa6209c1f0360b699b72ef8ab47dbeb81cc23be7db9049
{% endblock %}

{% block bld_libs %}
lib/c
lib/curl
lib/gtk/3
lib/notify
lib/openssl
lib/gtk/deps
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/intltool
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block configure_flags %}
--disable-rss-notify
--disable-gstreamer
--with-openssl=yes
{% endblock %}

{% block setup_target_flags %}
export CPPFLAGS="-fcommon ${CPPFLAGS}"
{% endblock %}
