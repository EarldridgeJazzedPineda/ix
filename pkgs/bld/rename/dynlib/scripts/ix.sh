{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

base64 -d << EOF > rename_dynlib
{% include 'fix.py/base64' %}
EOF

chmod +x *
{% endblock %}
