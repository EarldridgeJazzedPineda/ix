{% extends '//die/c/autorehell.sh' %}

{% block version %}
1.3.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/mpc/mpc-{{self.version().strip()}}.tar.gz
sha:ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8
{% endblock %}

{% block lib_deps %}
lib/c
lib/gmp
lib/mpfr
{% endblock %}

{% block env %}
export COFLAGS="--with-mpc=${out} \${COFLAGS}"
{% endblock %}
