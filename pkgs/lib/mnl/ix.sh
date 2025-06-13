{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libmnl
{% endblock %}

{% block version %}
1.0.5
{% endblock %}

{% block fetch %}
#https://www.netfilter.org/pub/libmnl/libmnl-1.0.5.tar.bz2
https://github.com/stal-ix/sources/raw/main/libmnl-{{self.version().strip()}}.tar.bz2
274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b40d0525
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block env %}
export COFLAGS="--with-mnl=${out} --with-libmnl=${out} \${COFLAGS}"
{% endblock %}
