dosseg
PRINT MACRO P1
LEA DX,P1
MOV AH,9
INT 21H
ENDM
.model small
.stack 100h

.data
CAN1 DB 10,13,"THE CANDIDATE ID OF IMRAN KHAN IS: 1$"
CAN2 DB 10,13,"THE CANDIDATE ID OF NAWAZ SHARIF IS: 2$"
CAN3 DB 10,13,"THE CANDIDATE ID OF ARMY IS: 3$"
msg2 db 10,13,"PLEASE CAST YOUR VOTE AMONG ANYONE OF THEM!: $"
thanks db 10,13,"THANKS FOR VOTING...! $"
iv db 10,13,"Invalid Vote$"
m1 db 10,13,"imran votes: $"
m2 db 10,13,"nawaz votes: $"
m3 db 10,13,"army votes: $"
imran dw 0
nawaz dw 0
army dw 0
range db 0
result dw ?
w1 db 10,13,"imran wins $"
w2 db 10,13,"nawaz wins $"
w3 db 10,13,"army wins $"
.code
main proc
    mov ax, @data
    mov ds, ax 
    input:
    print can1
    print can2
    print can3
    print msg2
    cmp range,5
    je endd
    inc range
    call inn
    cmp al,'1'
    je ik
    cmp al,'2'
    je ik1
    cmp al,'3'
    je ik2
    ik:
    inc imran
    call inn
    cmp al,13 
    print thanks
    call inn
    cmp al,13
    jmp clssc
    ik1:
    inc nawaz
    call inn
    cmp al,13
    print thanks
    call inn
    cmp al,13
    jmp clssc
    ik2:
    inc army
    call inn
    cmp al,13 
    print thanks
    call inn
    cmp al,13
    jmp clssc
    clssc:
    mov ah,00
    mov al,02
    int 10h
    jmp input
    endd:
    print m1
    mov ax,imran
    add ax,48
    mov dx,ax
    mov ah,2
    int 21h
    print m2
    mov ax,nawaz
    add ax,48
    mov dx,ax
    mov ah,2
    int 21h
    print m3
    mov ax,army
    add ax,48
    mov dx,ax
    mov ah,2
    int 21h

mov ax,imran
mov bx,nawaz
cmp ax,bx    
jg firstt          
mov ax,army 
cmp bx,ax
mov result,bx
jg firstt1        
mov result,ax
jg firstt1

firstt:
mov bx,army
cmp ax,bx
mov result,ax
jg firstt1        
mov result,bx
jg firstt1

firstt1:
call enterkey
mov dx,result
add dx,48
mov ah,2
int 21h

mov ax,result
cmp ax,imran
je l1
cmp ax,nawaz          ; to edit
je l2
cmp ax,army
je l3
l1:
print w1
jmp endss
l2:
print w2
jmp endss
l3:
print w3
jmp endss

    endss:
    mov ah,4ch
    int 21h
main endp
inn proc
mov ah,1
int 21h
ret 
inn endp
enterkey proc
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
ret
enterkey endp
end main