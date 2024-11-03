{% extends '//die/gen.sh' %}

{% block run_deps %}
bin/sched(delay={{delay}})
{% endblock %}

{% block install %}
cd ${out}; mkdir -p etc/sched/{{delay}}; cd etc/sched/{{delay}}

cat << EOF > trash_dir_{{trash_dir | b64e}}.sh
exec rm -rf {{trash_dir}}/*
EOF
{% endblock %}
