{% extends 't/ix.sh' %}

{% block c_rename_symbol %}
{{super()}}
SECMEM_pool_data_v1_0
{% endblock %}

{% block cpp_defines %}
{{super()}}
{% if freebsd %}
HAVE_CMSGCRED=1
{% endif %}
{% endblock %}
