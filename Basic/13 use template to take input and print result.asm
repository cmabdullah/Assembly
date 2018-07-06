; multi-segment executable file template.

data segment
    ; add your data here!
    x db 0
    pkey db "press any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here 
    
    
    
    mov ah,1 ; input
    int 21h
    mov x,al       
             
             
             
    ; print new line         
    mov ah,2
    mov dl,0dh ;carge return
    int 21h
    
    mov dl, 0ah;line feed
    int 21h
    
    
    mov ah,2; output
    
    mov dl,x
    int 21h
    
    ;my code end    
    
    
    
    
    
    
    
            
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
