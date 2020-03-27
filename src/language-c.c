void assembly_hello(void);
void c_hello(void);
void cpp_hello(void);
void fortran_hello_(void);
void cobol_hello(void);

int main(void) {
    assembly_hello();
    c_hello();
    cpp_hello();
    fortran_hello_();
    cobol_hello();
    return 0;
}

#include <stdio.h>
void c_hello(void) {
    puts("Hello from C!");
}

#include <libcob.h>
void cobol_hello_function(void);
void cobol_hello(void) {
    cob_init_nomain(0, NULL);
    cobol_hello_function();
}
