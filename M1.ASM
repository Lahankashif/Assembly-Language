;PROGRAM FOR EVEN AND ODD
DOSSEG
.MODEL SMALL
.STACK 100H
.DATA
VAR1 DB 'THE GIVEN NUMBER IS EVEN$'
VAR2 DB 'THE GIVEN NUMBER IS ODD$'
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX

MOV AH,1
INT 21H
MOV BL,2
DIV BL

MOV CH,AH
MOV DL,CH
ADD DL,48

CMP DL,'0'
JMP VARR

MOV DX,OFFSET VAR2
MOV AH,9
INT 21H
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN

VARR:
MOV DX,OFFSET VAR1
MOV AH,9
INT 21H
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN
