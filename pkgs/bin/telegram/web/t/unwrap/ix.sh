{% extends '//die/gen.sh' %}

{% block step_unpack %}
:
{% endblock %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

cat << EOF > telegram
#!/usr/bin/env sh
exec webview https://web.telegram.org/{{flavor}}
EOF

chmod +x telegram
{% endblock %}
