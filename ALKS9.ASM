dosseg
.model small
.stack 100h
.data

array db 'lahan'
array1 db 1,2,3

.code
main proc
        
mov ax,@data
mov ds,ax

mov si , offset array

mov cx,5                    ;INITIALIZING LOOP

strt:
mov dl,[si]                 ;PRINT ARRAY
mov ah,2
int 21h
inc si
loop strt

mov si , offset array1

mov cx,3                     ;INITIALIZING LOOP

start:
mov dl,[si]
add dl,48
mov ah,2                    ;PRINT ARRAY
int 21h
inc si
loop start


mov ah,4ch
int 21h
main endp
end main
