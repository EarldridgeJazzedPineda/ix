{% extends '//die/c/make.sh' %}

{% block version %}
1.218-3
{% endblock %}

{% block pkg_name %}
netcat-openbsd
{% endblock %}

{% block fetch %}
https://salsa.debian.org/debian/netcat-openbsd/-/archive/debian/{{self.version().strip()}}/netcat-openbsd-debian-{{self.version().strip()}}.tar.bz2
sha:609ac7de4078f8fe05306081f8f428e8e03441c675ba07ee4bddbe0730b7666d
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/bsd/overlay
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block patch %}
cat debian/patches/series | while read l; do
    patch -p1 < debian/patches/${l}
done

find . -type f | while read l; do
    sed -e 's|--no-add-needed||g' -i ${l}
done
{% endblock %}

{% block cpp_defines %}
b64_ntop\(x,y,z,k\)=-1
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nc ${out}/bin/
{% endblock %}
