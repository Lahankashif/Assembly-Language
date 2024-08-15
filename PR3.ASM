dosseg
.model small
.stack 100h
.data
imran dw 6
nawaz dw 9
army dw 4
r dw ?
.code
main proc
mov ax,@data 
mov ds,ax

mov ax,imran
mov bx,nawaz
cmp ax,bx    
jg firstt          ;if ax>bx jump firstt
mov ax,army 
cmp bx,ax
mov r,bx
jg firstt1         ;if bx>ax jump 
mov r,ax
jg firstt1

firstt:
mov bx,army
cmp ax,bx
mov r,ax
jg firstt1        ;if ax>bx jump firstt1
mov r,bx
jg firstt1

firstt1:
mov dx,r
add dx,48
mov ah,2
int 21h


mov ah,4ch
int 21h

main endp
end main