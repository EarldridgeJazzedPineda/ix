#pragma once

#if defined(__cplusplus)
extern "C" {
#endif

const char* ix_temp_dir();
const char* ix_uniq_socket();

char* ix_mkstemp_template();
int ix_mkstemp();

#if defined(__cplusplus)
}
#endif
