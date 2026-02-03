section .data
message: db 'Hello world!' , 0xa, 0xd

section .text

global _start:
_start:
        mov eax, 4
        mov ebx, 1
        mov ecx, message
        mov edx, 14
        int 0x80

        mov eax, 1
        int 0x80
