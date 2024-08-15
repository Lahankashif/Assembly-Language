dosseg
print macro s1
mov dx,offset s1
mov ah,9
int 21h
endm
.model small
.stack 100h
.data
std_1 db 'enter marks of student1: $'
std_2 db 'enter marks of student2: $'
std_3 db 'enter marks of student3: $'
marks db ?
.code
main proc
mov ax,@data
mov ds,ax

print std_1
mov ah,1      
int 21h

call enterkey

print std_2
mov ah,1
int 21h


mov ah,4ch
int 21h
main endp
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
