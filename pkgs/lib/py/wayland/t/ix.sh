{% extends '//die/c/ix.sh' %}

{% block version %}
0.4.17
{% endblock %}

{% block fetch %}
https://github.com/flacjacket/pywayland/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:e04befb267069ae317cd1a07f1d85b4bfc059090255e61b3efe49691a506aebd
{% endblock %}

{% block lib_deps %}
lib/c
lib/wayland
{% endblock %}

{% block bld_libs %}
lib/cffi
pip/setuptools
{% endblock %}

{% block bld_tool %}
bld/wayland
bld/pkg/config
bld/python/frozen(py_extra_modules=lib/cffi/module/register,python_ver={{python_ver}})
{% endblock %}

{% block build %}
${NATIVE_PYTHON} setup.py build
{% endblock %}

{% block install %}
${NATIVE_PYTHON} setup.py install \
    --prefix=${out} \
    --install-lib=${out}/lib
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
