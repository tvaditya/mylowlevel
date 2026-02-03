section .data
message: db 'Ola, mundo! Bem vindos ao Assembly x86', 0xd, 0xa
msg_len equ $ - message

section .text
global _start

_start:

    ; RSI = 0x22 (imediato)
    mov rsi, 0x22

    ; RSI = RAX (registrador-direto)
    mov rax, 0x1000
    mov rsi, rax

    ; RSI = MEM[RAX] (indireto)
    ; para evitar segfault, apontamos RAX para message
    lea rax, [message]
    mov rsi, [rax]

    ; RSI = RAX (LEA não acessa memória)
    lea rsi, [rax]

    ; RSI = MEM[message + RAX]  → conteúdo
    xor rax, rax               ; rax = 0
    mov rsi, [message + rax]

    ; RSI = message + RAX      → endereço
    lea rsi, [message + rax]

    ; ====== imprime a string ======
    mov rax, 1        ; syscall write
    mov rdi, 1        ; stdout
    lea rsi, [message]
    mov rdx, msg_len
    syscall

