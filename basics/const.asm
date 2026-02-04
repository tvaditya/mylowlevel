section .text 
global _start

VAL equ 5

_start:
    mov eax, VAL
    ; VAL = 5, mas não é possível alterar seu valor
    ; VAL = 10  ; isso causaria um erro de montagem
    ; VAL = 0x20 ; isso também causaria um erro de montagem     

    ; para mostrar que VAL é realmente 5, podemos imprimir seu valor
    ; convertendo-o para caractere (ASCII '5' = 0x35)
    add eax, '0'       ; converte o número para caractere ASCII
    mov [esp-1], al    ; armazena o caractere na pilha
    
    mov eax, 4         ; syscall write
    mov ebx, 1         ; stdout
    lea ecx, [esp-1]   ; endereço do caractere
    mov edx, 1         ; escrever 1 byte
    int 0x80           ; chamada de sistema
    
    ; exit
    mov eax, 1         ; syscall exit
    xor ebx, ebx  ; código de saída 0
    int 0x80      ; chamada de sistema