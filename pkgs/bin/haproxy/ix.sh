{% extends '//die/c/make.sh' %}

{% block pkg_name %}
haproxy
{% endblock %}

{% block version %}
3.2.2
{% endblock %}

{% block fetch %}
https://www.haproxy.org/download/{{self.version().strip() | field(0)}}.{{self.version().strip() | field(1)}}/src/haproxy-{{self.version().strip()}}.tar.gz
be64ed565c320e670bb909c5834f90303c3ec0c97af5befa45994961aaa6c6ec
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/pcre/2
lib/openssl
lib/execinfo
{% endblock %}

{% block ld_flags %}
-Wl,-z,nostart-stop-gc
{% endblock %}

{% block make_flags %}
TARGET=linux-musl
SBINDIR=${out}/bin
USE_CRYPT=1
USE_PCRE2=1
USE_OPENSSL=1
USE_BACKTRACE=1
{#
[275172.615921] haproxy[15445]: segfault at 30 ip 000000000091d354 sp 00007f70fd5b7760 error 4 in haproxy[71c354,455000+4df000] likely on CPU 73 (core 9, socket 1)
#}
USE_CPU_AFFINITY=0
{% endblock %}

{% block patch %}
sed -e 's|dlopen|dlopenxxx|g' -i src/tools.c
{% endblock %}
