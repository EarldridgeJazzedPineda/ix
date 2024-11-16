{% extends '//die/env.sh' %}

{% block env %}
export CPPFLAGS="-D__STDC_ISO_10646__=201505L ${CPPFLAGS}"

{% if x86_64 or aarch64 or riscv64 %}
export ac_cv_sizeof_off_t=8
export ac_cv_sizeof_size_t=8
export ac_cv_sizeof_ssize_t=8
{% endif %}

export lt_cv_dlopen=dlopen
export ac_cv_func_dup2=yes
export ac_cv_func_sbrk=yes
export ac_cv_func_fork=yes
export ac_cv_func_vfork=yes
export ac_cv_func_mkdir=yes
export lt_cv_dlopen_self=no
export ac_cv_func_strtod=yes
export ac_cv_func_fgetln=yes
export ac_cv_func_daemon=yes
export ac_cv_header_stdc=yes
export ac_cv_func_setenv=yes
export ac_cv_func_getenv=yes
export ac_cv_func_getcwd=yes
export ac_cv_func_strtol=yes
export ac_cv_func_getline=yes
export ac_cv_func_sysconf=yes
export ac_cv_func_strtoul=yes
export cf_cv_func_mkstemp=yes
export cf_cv_working_poll=yes
export ac_cv_func_lseek64=yes
export ac_cv_func_realpath=yes
export ac_cv_working_tzset=yes
export ac_cv_func_snprintf=yes
export cf_cv_func_nanosleep=yes
export ac_cv_func_setresgid=yes
export ac_cv_func_setresuid=yes
export ac_cv_func_fork_works=yes
export ac_cv_func_vfork_works=yes
export ac_cv_func_getpagesize=yes
export ac_cv_c_strptime_works=yes
export ac_cv_func_chown_works=yes
export ac_cv_have_decl_memmem=yes
export gl_cv_func_sigprocmask=yes
export ac_cv_header_stdbool_h=yes
export ac_cv_func_getaddrinfo=yes
export ac_cv_buggy_getaddrinfo=no
export gl_cv_func_fflush_stdin=yes
export ac_cv_header_inttypes_h=yes
export ac_cv_func_gettimeofday=yes
export ac_cv_type_sighandler_t=yes
export ac_cv_func_getdtablesize=yes
export ac_cv_func_memcmp_working=yes
export ac_cv_func_working_mktime=yes
export gl_cv_func_realpath_works=yes
export ac_cv_func_mmap_fixed_mapped=yes
export gl_cv_header_working_fcntl_h=yes
export ac_cv_func_stat_empty_string_bug=no
export ac_cv_type_struct_sockaddr_storage=yes
export gl_cv_func_fchownat_nofollow_works=yes
export gl_cv_func_fchownat_empty_filename_works=yes
export gl_cv_func_posix_spawn_file_actions_addclose_works=yes
# TODO(pg83): check it
export bash_cv_func_snprintf=yes
export bash_cv_func_sigsetjmp=present
{% endblock %}
