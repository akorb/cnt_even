global main
extern printf
extern exit

section .rodata
    vector: db 1,2,3,4,5,6,7,9
    str_mask: db `%i\n\0`

section .text

main:
    xor ecx, ecx    ; i for vector
    xor edx, edx    ; count of even numbers

loop_start:
    cmp ecx,8
    je end
    mov al, [vector+ecx]
    inc ecx
    and al,1
    jnz loop_start
    inc edx
    jmp loop_start

end:
    xor al, al        ; no vector arguments
    mov rdi, str_mask ; arg 1
    mov rsi, rdx      ; arg 2
    call printf

    xor rsi, rsi      ; arg 1
    call exit
