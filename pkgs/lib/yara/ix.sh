{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
yara
{% endblock %}

{% block version %}
4.2.2
{% endblock %}

{% block fetch %}
https://github.com/VirusTotal/yara/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:20bd56857c4b037c4baae71587b7d22d0b7bbb075a7afa516ba35dae50fadd25
{% endblock %}

{% block lib_deps %}
lib/c
lib/magic
lib/jansson
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block configure_flags %}
--enable-cuckoo=yes
--enable-magic=yes
--enable-macho=yes
--enable-dex=yes
{% endblock %}
