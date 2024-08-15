dosseg
.model small
.stack 100h

.data
    arr db '123'    ; Added null terminator for the string
    arr_len dw 0

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Calculate the length of the array
    mov si, offset arr
    mov cx, 0

l1:
    mov al, [si]
    cmp al, 0
    je len
    inc si
    inc cx
    jmp l1

len:
mov bx,0
mov bx ,si 
    mov arr_len, bx   ; Store the length in arr_len

    ; Convert the length to a string and display it
    mov ax, arr_len
    call display

    mov ah, 4Ch
    int 21h

main endp

display proc
    mov bx, 10
    mov cx, 0

convert:
    xor dx, dx        ; Clear DX for division
    div bx            ; AX = AX / 10, DX = AX % 10
    push dx           ; Push remainder (digit) onto stack
    inc cx            ; Increment count of digits
    cmp ax, 0
    jne convert       ; Repeat until AX is 0

print:
    pop dx            ; Get the next digit from the stack
    add dl, '0'       ; Convert to ASCII
    mov ah, 02h       ; DOS print character function
    int 21h           ; Print the character
    loop print        ; Repeat until all digits are printed

    ret
display endp

end main
