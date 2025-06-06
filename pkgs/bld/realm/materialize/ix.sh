{% extends '//die/gen.sh' %}

{% block run_deps %}
bld/sh
bld/box
bin/rsync
{% endblock %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > ix_install
{% include 'ix_install.sh/base64' %}
EOF

base64 -d << EOF > ix_postinstall
{% include 'ix_postinstall.sh/base64' %}
EOF

chmod +x *
{% endblock %}
