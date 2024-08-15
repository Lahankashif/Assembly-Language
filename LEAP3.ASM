dosseg
.model small
.stack 100h
.data
     YEAR Db 4 (?)
     E1 DB 'ENTER YEAR: $'
     R DB ?
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
        INT 21H                     ;INPUT

        MOV [SI],AL
        INC SI                      ;ADD Si
        LOOP START

        mov ah, year[2]
        sub ah, 48              ; Convert ASCII to numeric

    	mov bl, 10              ; Multiply AH by 10
    	mul bl                  ; AX = AH * 10
        mov bL,year[3]
        SUB BL,48
        add ax,bx              ; Add AL to AX (AH * 10 + AL)

        MOV BX,4
        DIV BX

        MOV R,AH
        MOV DL,R
        MOV AH,2
        INT 21H

        mov ah,4ch
        int 21h
main endp
end main
