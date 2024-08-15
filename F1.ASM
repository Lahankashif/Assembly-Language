dosseg
.model small
.stack 100h
.data
.code
main proc
mov cx,4
mov bl,48
xor cl,cl
r:
SUB BL,48
ADD CL,BL
ADD BL,1
loop r
MOV DL,CL
mov ah,2
int 21h
mov ah,4ch
int 21h
main endp
end main
