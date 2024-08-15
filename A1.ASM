dosseg
.model small
.stack 100h
.data
.code
main proc
mov ah,1
int 21h
sub al,48
sub al,1
mov cl,al
add al,1

l:
mul cl
loop l
aam
mov ch,ah
mov cl,al
mov dl,ch
add dl,48
mov ah,2
int 21h
mov dl,cl
add dl,48
mov ah,2
int 21h

mov ah, 4ch
int 21h

main endp
end main
