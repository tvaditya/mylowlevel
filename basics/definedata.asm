section .data
nome db "Digite seu nome: ", 0xa ; mensagem para o usuário - db é usado para definir bytes
msg_len equ $ - nome               ; calcula o comprimento da mensagem

myword dw 0x1234       ; define uma palavra (2 bytes) com valor hexadecimal 1234
mydword dd 0x12345678  ; define um double word (4 bytes) com valor hexadecimal 12345678
mylong dq 0x1234567890abcdef ; define um quad word (8 bytes) com valor hexadecimal 1234567890abcdef
myarray times 10 db 0 ; define um array de 10 bytes inicializados com 0

;now bss dados não iinicializados
section .bss
mybyte: resb 32 ; reserva 32 bytes para mybyte
myword_bss: resw 16 ; reserva 16 palavras (2 bytes cada)
mydword_bss: resd 8 ; reserva 8 double words (4 bytes cada)
mylong_bss: resq 4 ; reserva 4 quad words (8 bytes cada)    

