dosseg
.model small
.stack 100h
.data
pv1 dw ?
myBytes DB 8, 7, 6,5

mywords DW 9, 3, 7, 4, 6

myDoubles DD 1, 2, 3, 4, 5

.code
main proc
mov ax,@data
mov ds,ax
;mov al,'2'
;mov dl,al
;mov ah,2
;int 21h

;mov al,50
;mov dl,al
;mov ah,2
;int 21h

;mov al,2
;mov dl,al
;mov ah,2
;int 21h

;mov ax,5
;mov bx,7
;push ax
;add ax,4
;pop bx
;mov cx,ax
;push bx
;pop ax
;mov dx,ax
;add dx,48
;mov ah,2
;int 21h


MOV SI, OFFSET [myBytes+2]
mov dx,SI
add dx,48
mov ah,2
int 21h
;MOV AL, [ESI]
;MOV AL, [ESI+3]
;MOV ESI, OFFSET myWords+2
;MOV AX, [ESI]
;MOV EDI, 8
;MOV EDX, [myDoubles+EDI]
;MOV EDX, myDoubles [EDI]
mov ah,4ch
int 21h

main endp
end main
