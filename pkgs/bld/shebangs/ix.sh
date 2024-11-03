{% extends '//die/gen.sh' %}

{% block run_deps %}
bld/python
{% endblock %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

base64 -d << EOF > fix_shebangs
{% include 'fix.py/base64' %}
EOF

chmod +x *
{% endblock %}
