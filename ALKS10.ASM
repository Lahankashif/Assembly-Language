DOSSEG
.MODEL SMALL
.STACK 100H
.DATA
        R1 DB 50 DUP('$')
.CODE
MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV SI,OFFSET R1

        START:
        MOV AH,1
        INT 21H                      ;INPUT

        CMP AL,13
        JE PEND                      ;COMPARE TO END PROGRAM

        MOV [SI],AL
        INC SI                       ;ADD SI

        JMP START

        PEND:
        LEA DX,R1         ; Load the address of R1 into DL
        MOV AH,9            ;PRINT R1
        INT 21H

        MOV AH,4CH
        INT 21H
MAIN ENDP
END MAIN
