dosseg
.model small
.stack 100h
.data
.code
main proc
mov cx,5
mov dl,0
mov bl,1
sum:
add dl,bl
mov ah,2
add dl,48
int 21h
add bl,1
loop sum
mov ah,4ch
int 21h
main endp
end main
