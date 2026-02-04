section .data
    numerais: db '0123456789', 0xa, 0xd
    msg_len equ $ - numerais

    jumpline: db '-', 0xa, 0xd

section .text
global _start   

_start:

    xor esi, esi        ; contador i = 0
    jmp loop ;jmp para o início do loop

loop:
    mov eax, 4        ; syscall write
    mov ebx, 1        ; stdout
    lea ecx, [numerais + esi]  ; endereço do caractere atual
    mov edx, 1        ; escrever 1 byte
    int 0x80       ; chamada de sistema

    mov eax, 4        ; syscall write
    mov ebx, 1        ; stdout
    lea ecx, [jumpline]  ; endereço do caractere de nova linha
    mov edx, 2        ; escrever 2 bytes ( '-' + nova linha )
    int 0x80       ; chamada de sistema

    inc esi           ; i++
    cmp esi, 10      ; compara i com 10
    jle loop          ; se i < 10, repete o loop
    mov eax, 1        ; syscall exit
    xor ebx, ebx      ; código de saída 0
    int 0x80          ; chamada de sistema
    ;ret - not a good practice to use ret in _start