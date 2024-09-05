{% extends '//bin/mrustc/t/t/ix.sh' %}

{% block bld_libs %}
lib/z
lib/xz
lib/openssl
lib/git/2/old
lib/curl/lite
{{super()}}
{% endblock %}

{% block setup_target_flags %}
{{super()}}
export OPENSSL_DIR=${SSL_DIR}
{% endblock %}

{% block build %}
{{super()}}
cargo ${RUSTC_SRC}/src/tools/cargo
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${OUTPUT_DIR}/cargo ${out}/bin/
{% endblock %}
