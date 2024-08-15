;program to draw a triangle

dosseg
.model small
.stack 100h
.data
v1 db "RIGHT TRIANGLE$"
v2 db 0

.code
main proc
mov ax,@data
mov ds,ax
l1:
mov ah,6        ;scrolll windowup

mov al,1        ;no of lines

mov bh,00010000b ;set color

mov ch,0        ;starting postion
mov cl,0
mov dh,70       ;set bottom and left
mov dl,v2
int 10h
inc v2          ;inc 
cmp v2,18       ;cmp v2 with column
jne l1


mov dx,offset v1
mov ah,9           ;print prompt
int 21h



mov ah,4ch
int 21h

main endp
end main