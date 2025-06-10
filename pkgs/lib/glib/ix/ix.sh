{% extends '//lib/glib/t/ix.sh' %}

{% block lib_deps %}
lib/mimetype
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/kernel
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/glib
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
find ${out}/ -type f -name '*.pc' | while read i; do
    sed -e 's|${bindir}/||' \
        -e 's|.*bindir.*||' \
{% if darwin %}
        -e 's|Libs: .*||' \
{% endif %}
        -i ${i}
done
{% endblock %}

{% block patch %}
patch -p1 << EOF
{% include '0.diff' %}
EOF

patch -p1 << EOF
{% include '1.diff' %}
EOF

cat << EOF >> _
void gobject_init(void);
EOF

cat gobject/gtype.c | sed -e 's|gobject_init (void)|gobject_init_xxx (void)|' >> _

cat << EOF >> _
static int ginitdone;

void gobject_init(void) {
    if (!ginitdone) {
        ginitdone = 1;
        gobject_init_xxx();
    }
}
EOF

mv _ gobject/gtype.c

sed -e 's|.*fast && result_.*||' \
    -e 's|sniff_length = _.*|sniff_length = 1024;| ' \
    -i gio/glocalfileinfo.c

cat << EOF >> glib/gstrfuncs.h
#undef g_strdup
#undef g_str_has_suffix
#undef g_str_has_prefix
EOF

{{super()}}

{#
if get_option('runtime_dir') != ''
  // this shit is fundamentally broken
  glib_runstatedir = glib_prefix / get_option('runtime_dir')
else
  # While we’d normally prefix directories like this with, for example,
  # glib_localstatedir, `/run` is a bit different in that it’s for runtime state
  # rather than data files, so it’s typically functionally useless to use a
  # prefixed version. No other processes will be using it. So we default to the
  # unprefixed system `/run` directory.
  glib_runstatedir = '/run'
endif
#}
sed -e 's|/run|/var/run|' \
    -e 's|export_dynamic_cflags =.*|export_dynamic_cflags = []|' \
    -e 's|.*atomic_dep.*find_library.*||' \
    -i meson.build
{% endblock %}

{% block env %}
{{super()}}
export CPPFLAGS="-I${out}/include/glib-2.0 -I${out}/lib/glib-2.0/include -I${out}/include/gio-unix-2.0 \${CPPFLAGS}"
{% endblock %}

{% block run_data %}
{{super()}}
{% if target_realm %}
lib/glib/ix/fix
{% endif %}
{% endblock %}
