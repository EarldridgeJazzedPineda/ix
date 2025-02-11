{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/vulkan/icd.d; cd etc/vulkan/icd.d

# all mesa drivers go there, need better solution
for x in broadcom freedreno intel lvp panfrost radeon virtio swiftshader; do
    cat << EOF > ${x}_icd.{{target.arch}}.json
{
    "ICD": {
        "api_version": "1.2.195",
        "library_path": "libvulkan_${x}.so"
    },
    "file_format_version": "1.0.0"
}
EOF
done
{% endblock %}

{% block env %}
export VULKAN_LOADER_DATA="${out}"
{% endblock %}
