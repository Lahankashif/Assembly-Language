dosseg
.model small
.stack 100h
.data
.code
main proc

mov ah, 1 
int 21h 
mov cl, 8 
mov bl, al 
l1: 
shl bl, 1 
mov ah, 2 
mov dl, 0 
adc dl, 48 
int 21h
loop l1
mov ah,4ch
int 21h

main endp
enterkey proc
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
ret
enterkey endp

end main
