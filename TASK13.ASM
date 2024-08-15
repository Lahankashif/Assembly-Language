dosseg

print macro p1
mov dx,offset p1
mov ah,9                    ;USE OF MACRO
int 21h
endm

.model small
.stack 100h
.data
m1 db 'ENTER ARRAY: $'
m2 db 'YOUR LENGTH IS : $'
LGT db 0
ARR DB (?)
.code
main proc
mov ax,@data
mov ds,AX
        print m1            ;PRINTING M1
        MOV SI,OFFSET ARR
input:
       mov ah,1
       int 21h
       MOV [SI],AL
       cmp al,13
       je outt
       INC SI
       INC  LGT
LOOP INPUT
outt:

       print m2             ;PRINTING M2
       
      mov ah,0
      mov al,LGT
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
l2:                          ;NESTED LOOP
      pop dx
      add dx,48
      mov ah,2
      int 21h
loop l2


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
