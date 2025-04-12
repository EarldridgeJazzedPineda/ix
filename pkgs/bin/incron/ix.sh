{% extends '//die/c/make.sh' %}

{% block pkg_name %}
incron
{% endblock %}

{% block version %}
0.5.12
{% endblock %}

{% block fetch %}
https://github.com/ar-/incron/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:cce80bd723bafce59f35464f2f851d02707e32efa102e2b941ed0e42bdd38f91
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/argp/standalone
{% endblock %}

{% block make_flags %}
USERDATADIR=${out}/tmp
SYSDATADIR=${out}/etc/incron.d
INITDIR=${out}/etc/init
CFGDIR=${out}/etc
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
rm -rf etc
mv sbin/* bin/
rm -rf sbin
{% endblock %}

{% block cxx_flags %}
{{super()}}
-std=c++14
{% endblock %}

{% block patch %}
sed -e 's|-o $(USER)||g' -i Makefile
{% endblock %}
