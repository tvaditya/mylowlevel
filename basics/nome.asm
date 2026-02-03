section .data
message: db "Digite seu nome: ", 0xa
msg_len equ $ - message

section .bss
name: resb 32

section .text
global _start

_start:

;==== print pergunte ====
mov rax, 1
mov rdi, 1
lea rsi, [rel message]
mov rdx, msg_len
syscall

;=== input do seu nome ====
mov rax, 0
mov rdi, 0
lea rsi, [rel name]
mov rdx, 30
syscall

;=== print resposta ===
mov rax, 1
mov rdi, 1
lea rsi, [rel name]
mov rdx, 30
syscall

;==== exit ====
mov rax, 60
xor rdi, rdi
syscall

