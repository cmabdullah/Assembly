org 100h
.stack 100h
.model small
.data
    a db 0
    b db 0

.code
    mov ah,1  ; first input
    int 21h
    mov a,al
    
    mov ah,1   ;second input
    int 21h  
    mov b,al
              ;al assign second input
    add al,a
    mov b,al
    sub b,48
    
    
    mov ah,2
    mov dl,al
    int 21h
    
    