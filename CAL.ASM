DOSSEG
.MODEL SMALL
.STACK 100H
.DATA
	NUM1 DB ?
	NUM2 DB ?
	OPT DB ?
      	RESULT DB ?
      	M1 DB 'ENTER 1ST NUMBER: $'
      	M2 DB 'ENTER 2ND NUMBER: $'
      	M3 DB 'ENTER OPERATOR (+,-,*,/): $'
      	M4 DB 'RESULT: $'
.CODE
MAIN PROC
      	MOV AX,@DATA
      	MOV DS,AX

      	MOV AH,9
        LEA DX,M1      ;PRINT M1
      	INT 21H

      	MOV AH,1
        INT 21H          ;INPUT NUM1
      	SUB AL,48
      	MOV NUM1,AL

	MOV DX,10
	MOV AH,2
        INT 21H          ;ENTER AND CARRIAGE KEY
	MOV DX,13
	MOV AH,2
	INT 21H

      	MOV AH,9
        LEA DX,M2       ;PRINT M2
      	INT 21H

      	MOV AH,1
      	INT 21H
        SUB AL,48        ;INPUT NUM2
      	MOV NUM2,AL

	MOV DX,10
	MOV AH,2
        INT 21H          ;ENTER AND CARRIAGE KEY
	MOV DX,13
	MOV AH,2
	INT 21H

      	MOV AH,9
        LEA DX,M3        ;PRINT M3
      	INT 21H

      	MOV AH,1
        INT 21H          ;INPUT OPERATIR
       	MOV OPT,AL

	MOV DX,10
	MOV AH,2
        INT 21H          ;ENTER AND CARRIAGE KEY
	MOV DX,13
	MOV AH,2
	INT 21H

	MOV AH,9
        LEA DX,M4        ;PRINT M4
      	INT 21H

      	MOV AL,OPT
      	CMP AL,'+'
      	JE ADDITION
        CMP AL,'-'       ;COMPARE OPERATOR
      	JE SUBTRACT
      	CMP AL,'*'
      	JE MULTIPLY
      	CMP AL,'/'
      	JE DIVIDE

ADDITION:
      	MOV AL,NUM1
        ADD AL,NUM2       ;ADDING
      	MOV RESULT,AL
      	JMP RESULTS

SUBTRACT:
      	MOV AL,NUM1
        SUB AL,NUM2       ;SUBTRACTING
      	MOV RESULT,AL
      	JMP RESULTS

MULTIPLY:
      	MOV AL,NUM1
      	MUL NUM2
        MOV RESULT,AL     ;MULTIPLYING
      	JMP RESULTS

DIVIDE:
      	MOV AL,NUM1
      	MOV AH,0
      	MOV BL,NUM2
        DIV BL            ;DIVIDING
      	MOV RESULT,AL
      	JMP RESULTS

RESULTS:
      	AAM
      	MOV CH,AH
      	MOV CL,AL
      	MOV DL,CH
      	ADD DL,48
        MOV AH,2          ;PRINTING RESULTS
      	INT 21H
      	MOV DL,CL
      	ADD DL,48
      	MOV AH,2
      	INT 21H

MOV AH,4CH
INT 21H

MAIN ENDP
END MAIN
