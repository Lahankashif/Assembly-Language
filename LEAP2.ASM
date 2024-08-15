dosseg
.model small
.stack 100h
.data
     YEAR DB 5 dup(?)
     E1 DB 'ENTER YEAR: $'
     q db ?
     r db ?
.code
main proc

        MOV AX,@DATA
        mov ds,ax
        LEA DX,E1
        MOV AH,9
        INT 21H

        mov si,offset year
        mov cx,4
        START:
        MOV AH,1
        INT 21H                      ;INPUT
 
        SUB AL,48
        MOV [SI],AL
        INC SI                      ;ADD Si
        LOOP START

        MOV DX,10
        MOV AH,2
        INT 21h                       ;ENTER AND CARRIAGE KEY
        MOV DX,13
        MOV AH,2
        INT 21h


        mov ah,year[2]
        sub ah,48
        mov al,year[3]
        sub al,48
        
	mov bl,4
	div bl

	mov r,ah

	mov dl,r
	add dl,48
	mov ah,2
	int 21h

	mov ah,4ch
	int 21h
main endp
end main
