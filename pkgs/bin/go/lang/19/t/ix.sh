{% extends '//bin/go/lang/4/ix.sh' %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go1.19.10.tar.gz
sha:8b87b1de458bccd4aa239ec7c3be4683634a985ded6171ada2fd6150baf57630
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_tool %}
bld/tar
bld/perl
bld/python
{{super()}}
{% endblock %}

{% block use_data %}
aux/ca/bundle
{% endblock %}

{% block patch %}
{{super()}}
find . -type f -name '*.go' | while read l; do
    sed -e "s|/etc/.*/ca-bundle.crt|${CA_BUNDLE}|" -i ${l}
done
{% endblock %}

{% block build %}
cp -R ${GOROOT_BOOTSTRAP} ${tmp}/boot

find ${tmp}/boot | while read l; do
    chmod +rwx ${l}
done

export GOCACHE=${tmp}
export GOROOT=${tmp}/boot
export GOROOT_BOOTSTRAP=${tmp}/boot

{{super()}}
{% endblock %}
