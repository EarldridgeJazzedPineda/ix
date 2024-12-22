{% extends '//bin/xarchiver/stock/ix.sh' %}

{% block bld_libs %}
lib/shim/ix
{{super()}}
{% endblock %}

{% block cpp_missing %}
{{super()}}
ix.h
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|"/tmp/."|ix_temp_dir(), "/."|' -i src/socket.c
sed -e 's|"/tmp"|ix_temp_dir()|' -i src/pref_dialog.c
{% endblock %}
