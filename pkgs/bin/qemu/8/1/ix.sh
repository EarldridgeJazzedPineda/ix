{% extends '//bin/qemu/t/ix.sh' %}

{% block fetch %}
https://gitlab.com/qemu-project/keycodemapdb/-/archive/22b8996dba9041874845c7446ce89ec4ae2b713d/keycodemapdb-22b8996dba9041874845c7446ce89ec4ae2b713d.tar.bz2
4bc07b2298b517c86fad4b9f7514748d864311db4c88e8453fff4944a6b880ac
{% endblock %}

{% block git_repo %}
https://github.com/qemu/qemu
{% endblock %}

{% block git_branch %}
v8.1.3
{% endblock %}

{% block git_sha %}
aa8d39a5094ce4a9b1f2431056327821531763ced5d65eecb7ac60651596680e
{% endblock %}

{% block step_unpack %}
{{super()}}
cd subprojects
rm keycode*
extract 0 ${src}/*bz2
mv keycode* keycodemapdb
cd ..
sed -e 's|.*subdir.*tests.*||' -i meson.build
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/fdt
{% endblock %}
