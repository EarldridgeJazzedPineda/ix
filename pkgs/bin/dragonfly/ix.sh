{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
dragonfly
{% endblock %}

{% block version %}
1.0.0
{% endblock %}

{% block git_repo %}
https://github.com/dragonflydb/dragonfly
{% endblock %}

{% block git_sha %}
9ee040b5e7928e74c1be39398f8c7d320ee0c687b80248ef6c2d09b5ce8d62a0
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/curl
lib/boost
lib/xml/2
lib/uring
lib/abseil/cpp
lib/google/log
lib/google/test
{% endblock %}

{% block patch %}
cat << EOF > helio/cmake/third_party.cmake
function(add_third_party name)
endfunction()
EOF

cat << EOF > helio/cmake/internal.cmake
function(cxx_link name)
endfunction()
function(cxx_test name)
endfunction()
EOF

base64 -d << EOF > src/server/CMakeLists.txt
{% include 'CMakeLists.txt/base64' %}
EOF

find . -type f -name CMakeLists.txt | while read l; do
    sed -e 's|Boost::context||g' \
        -e 's|Boost::fiber||g' \
        -e 's|Boost::system||g' \
        -e 's|TRDP::gperf||g' \
        -e 's|TRDP::lua||g' \
        -e 's|TRDP::mimalloc||g' \
        -e 's|TRDP::rapidjson||g' \
        -e 's|TRDP::uring||g' \
        -e 's|absl::flat_hash_map||g' \
        -e 's|absl::random_random||g' \
        -e 's|absl::str_format||g' \
        -e 's|absl::strings||g' \
        -e 's|glog::glog||g' \
        -i ${l}
done
{% endblock %}
