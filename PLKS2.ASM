DOSSEG
.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 'HELLO$'
MSG2 DB 'WOLRD$'

.CODE

MAIN PROC

MOV AX,@DATA
MOV DS,AX
MOV DX,OFFSET MSG1
MOV AH,9
INT 21H
MOV DX,10
MOV AH,2
INT 21H
MOV DX,13
MOV AH,2
INT 21H
MOV DX, OFFSET MSG2
MOV AH, 9
INT 21H

MOV AH,4CH
INT 21H
MAIN ENDP
END  MAIN
