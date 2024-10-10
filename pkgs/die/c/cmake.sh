{% extends 'ninja.sh' %}

{% block std_box %}
bld/cmake
bld/pkg/config
{{super()}}
{% endblock %}

{% block all_build_flags %}
{{super()}}
{% if lib and 'wrap_cc' in super() %}
fix_cmake_lib
{% endif %}
{% endblock %}

{% block functions %}
{{super()}}

add_suffix() (
    set -eu; IFS=':'; for x in ${1}; do
        echo -n "${x}/${2};"
    done
)
{% endblock %}

{% block step_setup %}
{{super()}}

export SIP=$(add_suffix ${IX_T_DIR} include)
export SLP=$(add_suffix ${IX_T_DIR} lib)
export SPP=$(add_suffix ${IX_B_DIR} bin)
{% endblock %}

{% block configure %}
{% set command_args %}
{% block cmake_binary %}
cmake
{% endblock %}

-B {{ninja_build_dir}}
-G Ninja

{% block cmake_trace %}
-Wno-dev
{% endblock %}

${CMFLAGS}

{% block cmake_install_dirs %}
-DCMAKE_INSTALL_PREFIX="${out}"
-DCMAKE_INSTALL_LIBDIR="${out}/lib"
-DCMAKE_INSTALL_LIBEXECDIR="${out}/{{kind}}/{{uniq_id}}"
{% endblock %}

-DCMAKE_C_COMPILER="$(which ${CC})"
-DCMAKE_CXX_COMPILER="$(which ${CXX})"

-DCMAKE_AR="$(which ${AR})"
-DCMAKE_NM="$(which ${NM})"
-DCMAKE_RANLIB="$(which ${RANLIB})"

-DCMAKE_SYSTEM_INCLUDE_PATH="${SIP}"
-DCMAKE_SYSTEM_LIBRARY_PATH="${SLP}"
-DCMAKE_SYSTEM_PROGRAM_PATH="${SPP}"

{% set cmake_flags %}
CMAKE_SKIP_RPATH=ON
CMAKE_BUILD_TYPE=Release
BUILD_SHARED_LIBS=OFF
BUILD_TESTING=OFF
SITE=ix
{% if not boot %}
UNIX=1
__UNIX_PATHS_INCLUDED=1
{% if not native %}
CMAKE_SYSTEM_NAME={{target.cmake_system_name}}
CMAKE_SYSTEM_PROCESSOR={{target.arch}}
{% endif %}
{% endif %}
{% block cmake_flags %}
{% endblock %}
{% endset %}

{% for f in ix.parse_list(cmake_flags) %}
-D{{f}}
{% endfor %}

{% block cmake_extra_flags %}
{% endblock %}

{% block cmake_srcdir %}
.
{% endblock %}
{% endset %}

{{ix.fix_list(command_args)}}
{% if help %}
cmake -LA {{ninja_build_dir}} | grep -v 'CMAKE_'
exit 1
{% endif %}
{% endblock %}

{% block step_patch %}
{% if 'wrap_cc' not in build_flags %}
find . -name CMakeLists.txt -type f | while read l; do
    sed -e 's| MODULE | STATIC |g' \
        -e 's| SHARED | STATIC |g' \
        -i "${l}"
done
{% endif %}
{{super()}}
{% endblock %}
