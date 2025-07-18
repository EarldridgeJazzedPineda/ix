{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
findutils
{% endblock %}

{% block version %}
4.8.0
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/findutils/findutils-{{self.version().strip()}}.tar.xz
57127b7e97d91282c6ace556378d5455a9509898297e46e10443016ea1387164
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block patch %}
cd gl/lib/malloc

cat - dynarray-skeleton.c << EOF > _
#define __nonnull(x)
EOF

mv _ dynarray-skeleton.c
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|/.*/bin/sort|sort|' -i ${out}/bin/updatedb
{% endblock %}
