DOSSEG                                
.MODEL SMALL
.STACK 100H
.DATA
        YEAR DB 5 dup(?)
        E1 DB 'ENTER YEAR: $'
        E2 DB 'LEAP YEAR$'
        E3 DB 'NOT A LEAP YEAR$'
        r db ?
.CODE
MAIN PROC
        MOV AX,@DATA
        MOV DS,AX

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

        mov ax,offset year 
        mov bl,4
        div bl
        mov r,ah
        mov dl,r
        add dl,48
        int 21h
        cmp ah,0
        jne not_leap

        leap:
        lea dx,e2
        mov ah,9
        int 21h
        jmp endd

        not_leap:
        lea dx,e3
        mov ah,9
        int 21h

        endd:
        MOV AH,4CH
        INT 21H
MAIN ENDP
END MAIN
