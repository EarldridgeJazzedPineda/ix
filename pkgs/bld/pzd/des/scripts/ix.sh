{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin

base64 -d << EOF > ${out}/bin/des
{% include 'des/base64' %}
EOF

base64 -d << EOF > ${out}/bin/des_py
{% include 'des.py/base64' %}
EOF

chmod +x ${out}/bin/*
{% endblock %}
