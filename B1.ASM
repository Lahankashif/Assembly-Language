dosseg
.model small
.stack 100h
.data
    msg db 'Enter 3 sets of 3-digit numbers (e.g., 120 121 122):$' 
    array db 9 dup(?) 
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, msg
    mov ah, 9
    int 21h

    mov si, offset array
    mov cx, 11
    call input_numbers

    call print_numbers

    mov ah, 4ch
    int 21h
main endp

input_numbers proc
idin:
    mov ah, 1
    int 21h            
    cmp al, ' '
    je skip
    sub al, 48
    mov [si], al
    inc si
skip:
    loop idin
    call enterkey
    ret
input_numbers endp

print_numbers proc
    mov si, offset array
    mov cx, 9
    mov dx, 0 
l1:
    mov al, [si]
    cmp al, ' '
    je skip_print
    add al, '0'
    mov dl, al
    mov ah, 2
    int 21h
skip_print:
    inc si
    loop l1
    ret
print_numbers endp

enterkey proc
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h
    ret
enterkey endp

end main
