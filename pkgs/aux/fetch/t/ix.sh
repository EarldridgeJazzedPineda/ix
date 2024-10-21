{% extends '//die/std/ix.sh' %}

{% block bld_tool %}
bld/pzd
{% endblock %}

{% block use_network %}true{% endblock %}

{% block predict_outputs %}
[{"path": "share/{{self.fname().strip()}}", "sum": "{{sha}}"}]
{% endblock %}

{% block step_build %}
set -xue
{{super()}}
{% if refine %}
{{refine | b64d}}
{% endif %}
cd ..
stable_pack_v3 {{sha}} ${tmp}/{{self.fname().strip()}} src
{% endblock %}

{% block install %}
mkdir ${out}/share
mv ${tmp}/{{self.fname().strip()}} ${out}/share/
ls -la ${out}/share/
sha256sum ${out}/share/*
{% endblock %}
