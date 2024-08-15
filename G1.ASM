dosseg
.model small
.stack 100h
.data
.code
main proc
mov ah,6
mov al,10
mov bh,00010000b
mov ch,0
mov cl,10
mov dh,0
mov dl,16
int 10h
l1:
      inc ch
      dec cl 
      inc dh
      dec dl
mov ah,6
mov al,10
mov bh,00010000b
int 10h
cmp cl,0
jne l1

mov ah,4ch
int 21h

main endp
end main
