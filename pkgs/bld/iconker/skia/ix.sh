{% extends '//die/gen.sh' %}

{% block run_deps %}
bin/skia/svg
{% endblock %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

base64 -d << EOF > render_icon
{% include 'render.sh/base64' %}
EOF

chmod +x *
{% endblock %}
