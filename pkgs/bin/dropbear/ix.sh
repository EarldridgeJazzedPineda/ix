{% extends '2022/ix.sh' %}

{# TODO(pg) - discuss with upstream #}

{% block patch %}
{{super()}}
sed -e 's|"-c"|"-cl"|' -i dbutil.c
{% endblock %}
