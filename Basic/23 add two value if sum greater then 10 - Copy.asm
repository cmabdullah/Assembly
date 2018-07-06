org 100h
.model small
.stack 100h
.data 
    msg1 db  "Enter first digit : $"
    msg2 db 10,13, "Enter second digit : $"
    msg3 db 10,13, "Sum = : $"
    
                
    a db 0
    b db 0
    c db 0

.code
    mov ax,@data ; load data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h   
               
    mov ah,1
    int 21h
    sub al,48
    mov a,al  
    
    
    
    
    mov ah,9
    lea dx,msg2
    int 21h   
               
    mov ah,1
    int 21h
    sub al,48
    mov b,al 
    
    
    add al,a
    mov ah,0
    aaa
    
    
    add ah,48
    add al,48
    
    mov bx,ax
    
    mov ah,9
    lea dx,msg3
    int 21h
    
    mov ah,2
    mov dl,bh   ;high
    int 21h
       
    
    mov ah,2
    mov dl,bl   ;high
    int 21h
    ret