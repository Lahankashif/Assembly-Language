dosseg

print macro p1
mov dx,offset p1
mov ah,9                    ;USE OF MACRO
int 21h
endm

.model small
.stack 100h
.data
m1 db 'ENTER RANGE: $'
m2 db 'YOUR FIBNOCCI SERIES IN THE RANGE IS : $'
v1 db 0
v2 db 1
v3 dw ?
sum db ?
.code
main proc
mov ax,@data
mov ds,ax

        mov v3,0
        mov bl,10

        print m1            ;PRINTING M1
input:
       mov ah,1
       int 21h
       cmp al,13
       je outt
       sub al,48
       mov ah,0
       mov cx,ax            ;INPUT RANGE
       mov ax,v3
       mul bl
       add ax,cx
       mov v3,ax
jmp input

outt:
       print m2             ;PRINTING M2
       call enterkey        ;CALLING ENTER KEY
      mov cx,v3
      mov dl, '0'
      mov ah, 2
      int 21h

l:                          ;OUTER LOOP
      push cx

      mov bl,v1
      add bl,v2
      mov sum,bl

      mov ah,0
      mov al,sum             ;CALCULATING SUM

      mov dx,0
      mov bx,10
      mov cx,0
        
l1:                          ;NESTED LOOP
      div bx
      push dx
      mov dx,0
      mov ah,0
      inc cx
      cmp ax,0
      jne l1
      mov ah,2
      mov dl,0
      mov ah,2
      int 21h
l2:                          ;NESTED LOOP
      pop dx
      add dx,48
      mov ah,2
      int 21h
      loop l2

      mov bl,v2
      mov v1,bl
      mov bl,sum
      mov v2,bl

      mov dl,','             ;OUTPUT
      mov ah,2
      int 21h
      pop cx
loop l
mov ah,4ch
int 21h
main endp

enterkey proc
mov dx,10
mov ah,2
int 21h
mov dx,13                    ;PROCEDURE OF ENTERKEY
mov ah,2
int 21h
ret
enterkey endp

end main
