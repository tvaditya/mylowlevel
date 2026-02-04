section .data
message: db "Digite seu nome: ", 0xa
msg_len equ $ - message

section .bss
name: resb 32

; Macros para simplificar entrada e saída
%macro print 2
    mov eax, 4          ; syscall write
    mov ebx, 1          ; stdout
    mov ecx, %1         ; endereço da string
    mov edx, %2         ; tamanho da string
    int 0x80            ; chamada de sistema
%endmacro

%macro input 2
    mov eax, 3          ; syscall read
    mov ebx, 0          ; stdin
    mov ecx, %1         ; buffer para armazenar entrada
    mov edx, %2         ; tamanho máximo a ler
    int 0x80            ; chamada de sistema
%endmacro

section .text
global _start

_start:
    ; imprime a pergunta
    print message, msg_len
    
    ; lê o nome do usuário
    input name, 30
    
    ; imprime o nome digitado
    print name, 30
    
    ; exit
    mov eax, 1          ; syscall exit
    xor ebx, ebx        ; código de saída 0
    int 0x80            ; chamada de sistema
