{% extends '//die/c/cmake.sh' %}

{% block version %}
5.0
{% endblock %}

{% block fetch %}
https://github.com/nfs-ganesha/ntirpc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:c831398aa282cfb8b554c3301e7edb3334342405d222d88e1bef255d9a2b964f
{% endblock %}

{% block lib_deps %}
lib/c
lib/urcu
lib/nsl/naked
bin/nfs/ganesha/cdefs
{% endblock %}

{% block cpp_missing %}
assert.h
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{% endblock %}

{% block patch %}
sed -e 's|.*pthread_mutexattr_settype.*||' -i ntirpc/reentrant.h
sed -e 's|__FreeBSD__|__linux__|' -i ntirpc/rpc/rpcent.h
sed -e 's|bits/endian.h|endian.h|' -i src/xdr_float.c
{% endblock %}

{% block env %}
export NTIRPC_PREFIX=${out}
export CPPFLAGS="-DBSDBASED=0 \${CPPFLAGS}"
{% endblock %}
