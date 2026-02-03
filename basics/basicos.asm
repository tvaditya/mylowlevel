section .data
message: db "Mundo!", 0xa, 0xd

section .bss
name: resb 30

section .text
global _start
_start:
        mov rax, 1
        mov rdi, 1
        lea rsi, [rel message]
        ;mov rsi, message -deprecado
        mov rdx, 8
        syscall

        mov rax, 60
        xor rdi, rdi
