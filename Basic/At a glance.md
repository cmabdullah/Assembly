# 

### 11 input output single charaCter
```asm
org 100h
.model small
.stack 100h
.data
    x db 0
    
.code
    mov ah,1 ; input
    int 21h
    mov x,al
    
    mov ah,2; output
    
    mov dl,x
    int 21h
```



### 12 print ne line
```asm
org 100h
.model small
.stack 100h
.data
    x db 0
    
.code
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
```
### 13 use template to take input and print result
```asm
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

```
### 14 String output
```asm
org 100h
.stack 100h
.model small               
.data
    m db "hello$"
    
    
.code
    mov ah,9 ; string output
    lea dx,m
    int 21h
```
### 15 jump
```asm
 
.code
main proc
    first:
    mov dl,3
    add dl,48
    mov ah,2
    int 21h
    jmp second
    
    second:
    mov dl,4
    add dl,48
    mov ah,2
    int 21h
    jmp first    
```
### 22 add to value
```asm
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
    mov dl,b
    int 21h
    
    
```
### 23 add two value if sum greater then 10 - Copy
```asm
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
```

### 
```asm

```
### 
```asm

```
### 
```asm

```
