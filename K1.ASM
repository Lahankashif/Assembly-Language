dosseg
.model small
.stack 100h
.data
.code
main proc 
           mov bx,5
           mov cx,5

           start:
               push cx
               mov ah,2
               mov dl,32
          l2:
                int 21h
          loop l2
                mov cx,bx
                mov dl,'*'
          l3:
                int 21h
          loop l3

                mov ah,2
                mov dl,10
                int 21h
                mov dl,13
                int 21h

                dec bx
                pop cx
          loop start

endd:
mov ah,4ch
int 21h

main endp
end main
