{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/services/ly; cd etc/services/ly

cat << EOF > daemon
export TERM=linux
fixtty /dev/tty1
reset
clear
export LANG=C
exec setsid openvt -f -e -c 1 ly
EOF

cat << EOF > run
#!/bin/sh
exec srv ly /bin/sh ${PWD}/daemon
EOF

chmod +x run daemon
{% endblock %}
