DOSSEG
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
        MOV CX,5         ;INITIALIZE COUNTER

        MOV BL,101B      
        XOR BL,110B      ;XOR GATE
        ADD BL,48

L1:
        MOV DL,BL
        MOV AH,2
        INT 21H
        ADD BL,1         ;INCREMENT TO NUMBER

        MOV DX,10
        MOV AH,2
        INT 21H          ;ENTER AND CARRIAGE KEY
        MOV DX,13
        MOV AH,2
        INT 21H

LOOP L1


        MOV DX,10
        MOV AH,2
        INT 21H          ;ENTER AND CARRIAGE KEY
        MOV DX,13
        MOV AH,2
        INT 21H


        MOV CX,3         ;INITIALIZE 2nd COUNTER

        MOV BL,101B      
        OR BL,110B      ;OR GATE
        ADD BL,48

L2:
        MOV DL,BL
        MOV AH,2
        INT 21H
        ADD BL,1         ;INCREMENT TO NUMBER

        MOV DX,10
        MOV AH,2
        INT 21H          ;ENTER AND CARRIAGE KEY
        MOV DX,13
        MOV AH,2
        INT 21H

LOOP L2


        MOV AH,4CH
        INT 21H

MAIN ENDP
END MAIN

