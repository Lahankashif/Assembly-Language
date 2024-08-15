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
mov cx,100
mov dx,50
int 10h

mov bl,70
fLine:
int 10h
inc cx
dec bl
jnz fLine

mov bl,40
sLine:
int 10h
inc dx
dec cx
dec bl
jnz sLine

mov bl,70
tLine:
int 10h
dec cx
dec bl
jnz tLine

mov bl,40
frLine:
int 10h
dec dx
inc cx
dec bl
jnz frLine


mov ah,4ch
int 21h

main endp
end main
