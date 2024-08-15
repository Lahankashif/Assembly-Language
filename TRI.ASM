dosseg
.model small
.stack 100h
.data
.code
main proc

mov ah,0
mov al,13h
int 10h

mov ah,0ch
mov al,10
mov cx,20
mov dx,80
int 10h

mov bl,80
fLine:
int 10h
inc cx
dec bl
jnz fLine

mov bl,40
sLine:
int 10h
dec dx
dec cx
dec bl
jnz sLine

mov bl,40
tLine:
int 10h
dec cx
inc dx
dec bl
jnz tLine

mov ah,0ch
mov al,10
mov cx,110
mov dx,80
int 10h

mov bl,50
fLine1:
int 10h
inc cx
dec bl
jnz fLine1

mov bl,50
sLine1:
int 10h
dec dx
dec cx
dec bl
jnz sLine1

mov bl,50
tLine1:
int 10h
inc dx
dec bl
jnz tLine1


mov ah,0ch
mov al,10
mov cx,170
mov dx,80
int 10h

mov bl,50
fLine2:
int 10h
inc cx
dec bl
jnz fLine2

mov bl,50
sLine2:
int 10h
dec dx
dec bl
jnz sLine2

mov bl,50
tLine2:
int 10h
inc dx
dec cx
dec bl
jnz tLine2


mov ah,4ch
int 21h

main endp
end main

