DOSSEG
PRINT MACRO P1
    MOV DX, OFFSET P1
    MOV AH, 9
    INT 21H
ENDM
.MODEL SMALL 
.STACK 100H 
.DATA 
 V1 DB 'PATTERN IS: $'
 
.CODE 
    MAIN: 
        MOV AX, @DATA 
        MOV DS, AX 
        
        PRINT V1
        CALL ENTERKEY
 
        MOV CL,55

    LOOP1: 
        MOV DL, CL 
    LOOP2: 
        MOV AH,2 
        INT 21H 
         
        DEC DL 
        CMP DL,48 
        JNE LOOP2 
         
        MOV DL,10
        MOV AH,2 
        INT 21H 
         
         
        MOV DL,13 
        MOV AH,2 
        INT 21H 
         
         
        DEC CL 
        CMP CL, 48 
        JNE LOOP1 
         
          
         
        MOV AH,4CH 
        INT 21H


ENTERKEY PROC
    MOV DX,10
    MOV AH,2
    INT 21H
    MOV DX,13
    MOV AH,2
    INT 21H
    RET
ENTERKEY ENDP 
END MAIN
