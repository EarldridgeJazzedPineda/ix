{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/fetch
{% include 'fetch.sh/base64' %}
EOF
chmod +x ${out}/bin/fetch
{% endblock %}
