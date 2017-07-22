section .data
star db '*'
lh equ $ -star

ent db 0x0A

section .bss
num resb 2

section .text
global _start

%macro write 2
mov eax, 4
mov ebx, 1
mov ecx, %1
mov edx, %2
int 0x80
%endmacro

%macro read 2
mov eax, 3
mov ebx, 1
mov ecx, %1
mov edx, %2
int 0x80
%endmacro

_start:
read num, 1

mov rcx, [num]
sub rcx, '0'

_lp:
inc rbx
push rbx
push rcx
mov rcx, rbx

_lp2:
push rcx
write star, lh


pop rcx

loop _lp2

write ent, 2

pop rcx
pop rbx
loop _lp

_exit:
mov eax, 1
int 0x80
