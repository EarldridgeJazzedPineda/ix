{% extends '//die/gen.sh' %}

{% block run_deps %}
bin/sched(delay={{delay}})
{% endblock %}

{% block install %}
cd ${out}; mkdir -p etc/sched/{{delay}}; cd etc/sched/{{delay}}

base64 -d << EOF > fstrim.sh
{% include 'fstrim.sh/base64' %}
EOF
{% endblock %}
