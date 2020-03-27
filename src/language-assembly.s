section .data
    hello:      db  'Hello from Assembly!',10
    hello_len:  equ $-hello

section .text
    global assembly_hello

assembly_hello:
    mov eax, 4
    mov ebx, 1
    mov ecx, hello
    mov edx, hello_len
    int 0x80
    xor eax, eax
    ret

