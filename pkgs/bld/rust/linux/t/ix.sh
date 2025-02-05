{% extends '//die/std/ix.sh' %}

{% block bld_tool %}
bld/musl
bin/patch/elf
{% endblock %}

{% block install %}
cat components | while read x; do
    cp -R ${x}/* ${out}/
done
{% endblock %}

{% block postinstall %}
rm -rf ${out}/share
rm -rf ${out}/lib/rustlib/x86_64-unknown-linux-musl/bin
find ${out} -type f -executable | while read l; do
    echo "patch ${l}"
    patchelf --set-interpreter ${LDSO} ${l} || true
done
{% endblock %}
