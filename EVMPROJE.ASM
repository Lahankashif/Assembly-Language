PRINT MACRO P1
LEA DX,P1          
MOV AH,9           
INT 21H            
ENDM

DOSSEG
.MODEL SMALL
.STACK 100H

.DATA
CANDIDATE1 DB 10,13,"THE CANDIDATE ID OF IMRAN KHAN IS: 1$"  
CANDIDATE2 DB 10,13,"THE CANDIDATE ID OF NAWAZ SHARIF IS: 2$"  
CANDIDATE3 DB 10,13,"THE CANDIDATE ID OF ARMY IS: 3$"  
MSG DB 10,13,"PLEASE CAST YOUR VOTE AMONG ANYONE OF THEM!: $"  
THANKS DB 10,13,"THANKS FOR VOTING...! $"  
IV DB 10,13,"INVALID VOTE$"  
M1 DB 10,13,"VOTES GAINED BY IMRAN KHAN: $"  
M2 DB 10,13,"VOTES GAINED BY NAWAZ SHARIF: $"  
M3 DB 10,13,"VOTES GAINED BY ARMY: $"  
VT_IK DW 0  
VT_NZ DW 0  
VT_ARM DW 0
RANGE DB 0
RESULT DW ?  
W1 DB 10,13,"IMRAN KHAN WINS $"  
W2 DB 10,13,"NAWAZ SHARIF WINS $"   
W3 DB 10,13,"ARMY WINS $"   
DRAW DB 10,13,"THIS IS A TIE! ARMY WILL DECIDE$"   
.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX 
    
PROMPT:               
    PRINT CANDIDATE1   
    PRINT CANDIDATE2   
    PRINT CANDIDATE3   
    PRINT MSG          

    CMP RANGE,6        
    JE ENDD            
    INC RANGE          
    CALL INP_VOTE      

    ; Comparing input vote with candidate IDs
    CMP AL,'1'    
    JE IK             ; If vote is for candidate 1
    CMP AL,'2'
    JE NZ             ; If vote is for candidate 2
    CMP AL,'3'
    JE ARM            ; If vote is for candidate 3
    JMP INVALID       ; If invalid vote, jump to INVALID

IK:
    INC VT_IK          
    PRINT THANKS       
    CALL INP_VOTE      
    CMP AL,13          
    JMP CLSSC          

NZ:
    INC VT_NZ          
    PRINT THANKS
    CALL INP_VOTE
    CMP AL,13
    JMP CLSSC

ARM:
    INC  VT_ARM        
    PRINT THANKS
    CALL INP_VOTE
    CMP AL,13
    JMP CLSSC
         
INVALID:
    PRINT IV           
    CALL INP_VOTE
    CMP AL,13
    JMP CLSSC
         
CLSSC:                 
    MOV AH,00
    MOV AL,02
    INT 10H
    JMP PROMPT         

ENDD:
    PRINT M1           

    MOV AX,VT_IK       
    ADD AX,48          
    MOV DX,AX
    MOV AH,2           
    INT 21H

    ; Similar process for printing votes of candidate 2 and candidate 3
    PRINT M2
    MOV AX,VT_NZ
    ADD AX,48
    MOV DX,AX
    MOV AH,2
    INT 21H

    PRINT M3
    MOV AX,VT_ARM
    ADD AX,48
    MOV DX,AX
    MOV AH,2
    INT 21H

    ; Comparison and declaration of winner
    MOV AX,VT_IK
    MOV BX,VT_NZ
    CMP AX,BX
    JE TIE            ; If votes for Imran Khan and Nawaz Sharif are equal, check with Army
    JG IK_ARM         ; If Imran Khan has more votes than Nawaz Sharif, check with Army
    JL NZ_ARM         ; If Nawaz Sharif has more votes than Imran Khan, compare with Army

TIE:
    MOV BX,VT_ARM
    CMP AX,BX
    JE DRAW_RES       ; If all candidates have equal votes, it's a tie
    JL ARM_WINNER     ; If Imran Khan and Nawaz Sharif have less votes and Army has more, Army wins 

DRAW_RES:
    PRINT DRAW        ; Print tie message
    JMP EXIT

IK_ARM:
    MOV BX,VT_ARM
    CMP AX,BX 
    JE TIE
    JG WINNER
    JL NZ_ARM
 
NZ_ARM:
    MOV AX,VT_NZ
    MOV BX,VT_ARM
    CMP AX,BX
    JE TIE
    JG WINNER

ARM_WINNER:
    MOV AX,VT_ARM
    JMP WINNER

WINNER:
    MOV RESULT,AX    ; Store the result
    JMP PRINT_RESULT

PRINT_RESULT:
    CALL ENTERKEY     
    MOV DX,RESULT
    ADD DX,48         
    MOV AH,2
    INT 21H

    MOV AX,RESULT
    CMP AX,VT_IK
    JE L1            ; If result matches votes for Imran Khan, jump to L1
    CMP AX,VT_NZ
    JE L2            ; If result matches votes for Nawaz Sharif, jump to L2
    CMP AX,VT_ARM
    JE L3            ; If result matches votes for Army, jump to L3

L1:
    PRINT W1         ; Declare winner and exit
    JMP EXIT

L2:
    PRINT W2
    JMP EXIT

L3:
    PRINT W3
    JMP EXIT

    
EXIT:
    MOV AH,4CH
    INT 21H

MAIN ENDP

INP_VOTE PROC        ; Subroutine for inputting votes
    MOV AH,1
    INT 21H
    RET 
INP_VOTE ENDP

ENTERKEY PROC        ; Subroutine for printing new line
    MOV DX,10
    MOV AH,2
    INT 21H
    MOV DX,13
    MOV AH,2
    INT 21H
    RET
ENTERKEY ENDP

END MAIN
