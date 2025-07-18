{% extends '//lib/unbound/t/ix.sh' %}

{% block bld_libs %}
{% if linux %}
lib/mnl
lib/bsd
{% endif %}
lib/event
lib/openssl
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-libbsd
--with-pthreads
--without-dynlibmodule
--enable-static-exe
--enable-fully-static
{% endblock %}
