dosseg
.model small
.stack 100h
.data
.code
main proc

mov ax,0600h
mov bh,07h
int 10h
mov ax,013h
int 10h
mov cx,10
mov dx,100
mov bx,35    
push bx
mov bx,60   ;one side
push bx
pop bx
                                                                                                                                        

fLine:
mov ah,0ch
mov al,02ch
int 10h
inc cx
cmp cx,bx
jnz fLine

                                                                                                                                        
pop bx
sLine:
int 10h
dec cx
dec dx
cmp cx,bx
jnz sLine

                                                                                                                                        

tLine:
int 10h
dec cx
inc dx
cmp cx,9
jnz tLine


mov ah,4ch
int 21h

main endp
end main
