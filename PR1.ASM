dosseg
.model small
.stack 100h
.data
        msg1 db 'enter CANDIDATE1 id:$'
        msg2 db 'enter CANDIDATE2 id:$'
        msg3 db 'enter CANDIDATE3 id:$'
        arr1 db 3 dup(?)
        ARR2 DB 3 DUP(?)
        ARR3 DB 3 DUP(?)
        v1 db 'hi$'
.code
main proc            
        mov ax,@data
        mov ds,ax
        lea dx,msg1
        mov ah,9
        int 21h

        mov si,offset arr1
        idin1:
        mov ah,1
        int 21h
        CMP AL,13
        je m1
        sub al,48
        mov [si],al
        inc si
        loop idin1

        
m1:
        call enterkey
        call id1
        lea dx,msg2
        mov ah,9
        int 21h
        MOV SI,OFFSET ARR2
        IDIN2:
        MOV AH,1
        INT 21H
        CMP AL,13
        je m2
        sub al,48
        mov [si],al
        inc si
        loop idin2
      
m2:
        call enterkey
        call id2
        lea dx,msg3
        mov ah,9
        int 21h
        MOV SI,OFFSET ARR3
        IDIN3:
        MOV AH,1
        INT 21H
        CMP AL,13
        Je m3
        sub al,48
        mov [si],al
        inc si
        loop idin3
m3: 
    call enterkey
    call id3     
        OUTT:
        mov ah,4ch
        int 21h
main endp

         id1 proc
         mov al,arr1[1]
         mov bl,10
         mul bl
         mov bl,al
         mov al,0
         mov al,arr1[2]
         add al,bl
         mov cl,al
         mov bl,0
         mov al,0
         mov al,arr1[0]
         mov bl,100
         mul bl
         add al,cl
         mov dx,0
         mov bx,10
	 mov cx,0
l1:
	 div bx
	 push dx
	 mov dx,0
         mov ah,0
	 inc cx
         cmp ax,0
         jne l1
	 mov ah,2
l2: 
	 pop dx
	 add dx,48
	 int 21h
loop l2
         ret
         id1 endp

         id2 proc
         mov al,arr2[1]
         mov bl,10
         mul bl
         mov bl,al
         mov al,0
         mov al,arr2[2]
         add al,bl
         mov cl,al
         mov bl,0
         mov al,0
         mov al,arr2[0]
         mov bl,100
         mul bl
         add al,cl
         mov dx,0
         mov bx,10
	 mov cx,0
l3:
	 div bx
	 push dx
	 mov dx,0
         mov ah,0
	 inc cx
         cmp ax,0
         jne l3
	 mov ah,2
l4: 
	 pop dx
	 add dx,48
	 int 21h
loop l4
         ret
         id2 endp
 id3 proc
         mov al,arr3[1]
         mov bl,10
         mul bl
         mov bl,al
         mov al,0
         mov al,arr3[2]
         add al,bl
         mov cl,al
         mov bl,0
         mov al,0
         mov al,arr3[0]
         mov bl,100
         mul bl
         add al,cl
         mov dx,0
         mov bx,10
	 mov cx,0
l5:
	 div bx
	 push dx
	 mov dx,0
         mov ah,0
	 inc cx
         cmp ax,0
         jne l5
	 mov ah,2
l6: 
	 pop dx
	 add dx,48
	 int 21h
loop l6
         ret
         id3 endp
enterkey proc 
	 mov dl,10
	 mov ah,2
	 int 21h
	 mov dl,13
	 mov ah,2
	int 21h
 	 ret
 	 enterkey endp
end main