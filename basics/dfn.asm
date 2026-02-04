section .text 
global _start

; %define permite definir macros de texto
%define NUM 3
%define ADICIONA_DOIS add eax, 2
%define STDOUT 1

_start:
    mov eax, NUM       ; eax = 3
    
    ; usa a macro ADICIONA_DOIS
    ADICIONA_DOIS      ; eax = 3 + 2 = 5
    
    ; imprimir o valor (5)
    add eax, '0'       ; converte para caractere ASCII
    mov [esp-1], al    ; armazena na pilha
    
    mov eax, 4         ; syscall write
    mov ebx, STDOUT    ; usa a macro STDOUT
    lea ecx, [esp-1]   ; endereço do caractere
    mov edx, 1         ; escrever 1 byte
    int 0x80           ; chamada de sistema
    
    ; %define pode ser redefinido
%define NUM 8
    
    mov eax, NUM       ; eax = 8
    add eax, '0'       ; converte para caractere ASCII
    mov [esp-1], al    ; armazena na pilha
    
    mov eax, 4         ; syscall write
    mov ebx, STDOUT    
    lea ecx, [esp-1]   ; endereço do caractere
    mov edx, 1         ; escrever 1 byte
    int 0x80           ; chamada de sistema
    
    ; exit
    mov eax, 1         ; syscall exit
    xor ebx, ebx       ; código de saída 0
    int 0x80           ; chamada de sistema
