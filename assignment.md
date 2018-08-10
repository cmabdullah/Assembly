### Exercise:1  Write a program to read a character from the keyboard and display it at the beginning of the next line.
```asm
.MODEL SMALL ; size of program
.STACK 100H ; stack segment
.DATA ; data segment  
    x db 0
.CODE ; code segment
MAIN PROC

    MOV AH,1 ; char input is in register AL
    INT 21H
    MOV x,AL 
 
    MOV ah,2
    MOV dl,0DH
    INT 21H
 
     
    MOV DL,0AH
    INT 21H
     
    MOV AH,2 ; reads char from register DL
    MOV DL,x ; therefore move AL to DL
    INT 21H

    MOV AH,4CH ; exit
    INT 21H

MAIN ENDP
END MAIN 
```
### Exercise 2 : Write a program to read an uppercase character from the keyboard and display it at the beginning of the next line in lower case, with an appropriate message.
```asm
.MODEL SMALL
.STACK 100H
.DATA
M1 DB "Enter a Uppercase character: $"
M2 DB 0AH,0DH,"In Lowercase it is: $"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX  
    
    MOV AH,9
    LEA DX,M1
    INT 21H  

MOV AH,1 ;input char
INT 21H ;ASCII of input stored in AL
MOV BL,AL ;a is 61h and z is 7Ah in ASCII

    ADD BL,20H ;A is 41h, Z is 5Ah, therefore, subtract 20h
    MOV AH,9
    LEA DX,M2
    INT 21H

    MOV AH,2
    MOV DL,BL
    INT 21H 

    MOV AH,1
    INT 21H  

    MOV AH, 4CH
    INT 21H 
    
MAIN ENDP
END MAIN 

```
### Exercise 3 :  Write a program to read to read five characters from keyboard and display them into the next line in reverse order. Simple execution: ENTER 5 CHARACTERS: ABCDE REVERSE ORDER: EDCBA
```asm
.MODEL SMALL
.STACK 100H
.DATA 
    a db 0  
    b db 0  
    c db 0 
    d db 0
    e db 0
    
M1 DB "ENTER THREE INITIALS: $" 
M2 DB "REVERSE ORDER: $"
NL DB 0AH,0DH,"$" ;0AH newline, 0DH carriage return
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX       
    
    MOV AH,9 ;print string
    LEA DX,M1
    INT 21H  

    MOV AH,1 ;1st char input
    INT 21H 
    MOV a,AL ;move to BH 

    INT 21H ;2nd char input  
    MOV b,AL ;move to BL 
 
    INT 21H ;3rd char input
    MOV c,AL ;move to CL 

    INT 21H ;3rd char input
    MOV d,AL ;move to CL 

    INT 21H ;3rd char input
    MOV e,AL ;move to CL 

    MOV AH,9
    LEA DX,NL
    INT 21H 

    MOV AH,9
    LEA DX,M2
    INT 21H 

    MOV AH,2 ;print 1st char which is in BH
    MOV DL,e
    INT 21H

    MOV AH,2 ;print 2nd char which is in BL
    MOV DL,d
    INT 21H 

    MOV AH,2 ;print 3rd char which is in CL
    MOV DL,c
    INT 21H
    
    MOV AH,2 ;print 3rd char which is in CL
    MOV DL,b
    INT 21H

    MOV AH,2 ;print 3rd char which is in CL
    MOV DL,a
    INT 21H

;MOV AH,1
;INT 21H  
MOV AH, 4CH
INT 21H
MAIN ENDP
END MAIN 
```
### Exercise 4 : Write a program to prompt the user, read two decimal digits whose sum is greater than 10, and display them and their sum on the next line, with an appropriate message. Sample execution: ENTER TWO DECIMAL DIGITS: 8 7 THE SUM OF 8 AND 7 IS 15
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
### Exercise 5 : Write a program to display a”?” read three characters, and then display them in the middle of a 9×9 box of asterisks.
```asm
.MODEL SMALL
.DATA
STARS DB ,'*********',0AH,0DH,'$'
MID DB '***'
C1 DB ?
C2 DB ?
C3 DB ?,'***',0AH,0DH,'$' 

.CODE
MAIN PROC
MOV AX,@DATA ; initialize DS
MOV DS,AX 

    MOV BL,"?"
    MOV AH,2
    MOV DL,BL
    INT 21h

    MOV AH,1 ;read & store 3 initials
    INT 21H 
    
    MOV C1,AL
    INT 21H   
    
    MOV C2,AL
    INT 21H   

    MOV C3,AL
    MOV AH,2 ; CR to current line
    MOV DL,0DH
    INT 21H  

    MOV DL,0AH
    INT 21H 

    MOV AH,9 ;( display stars from the
    ; beginning of line that will
    ;cause to erase the 3 initial
    ;and write over them)
    LEA DX,STARS
    INT 21H
    INT 21H
    INT 21H
    INT 21H

    LEA DX,MID ;( display the middle
    ;line with initials)
    INT 21H 

    LEA DX,STARS ;continue displaying stars
    INT 21H
    INT 21H
    INT 21H
    INT 21H

MOV AH,4CH ; return to DOS
INT 21H
MAIN ENDP
END MAIN
```
### Exercise 6 : Write a program to prompt the user, read a character, and if it is an uppercase letter, display it at the beginning of the next line. If the user enters an illegal character, display message “ILLEGAL CHARACTER”.
```asm
org 100h
.model small
.stack 100h
.data
    x db 0
    y db "ILLEGAL Character $ "
    
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
    
    cmp x , "A"
    jge Step2 
    jl exit

 Step2:
    cmp x, "Z"
    jle Print 
    jmp exit
   
Print:
    mov ah,2; output
    mov dl,x
    int 21h
    jmp end   
    
exit:
    mov ah,09
    lea dx, y
    int 21h
 
end:   
    mov ah, 04ch
    int 21h

```
### Exercise 7 : Write a program to read two decimal numbers and determine the larger number.
```asm
.STACK 100H
.DATA
MSG1 DB 'ENTER TWO DIGITS: $'
MSG2 DB 0AH, 0DH, 'OUTPUT IS: $'
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX  

    MOV AH,9 ;string output
    LEA DX,MSG1 ; load effective address/offset into DX
    INT 21H
    
    MOV AH,1 ; char input, write into AL
    INT 21H
    MOV BL,AL 

    INT 21H
    MOV CL,AL 
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H 

    CMP BL,CL ; compare BL and CL contents
    JG ELSE_ ; jump to ELSE_ label if BL above CL
    MOV AH,2 ; char output, read from DL
    MOV DL,cl
    INT 21H 
    JMP EXIT


ELSE_:
    MOV AH,2
    MOV DL,bl
    INT 21H
;MOV DL,BL
;INT 21H
;JMP EXIT

EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP 
```
### Exercise 8 : Write a program that will prompt the user to enter a hex digit character (0 – 9 or A – F), display it on the next line in decimal, and ask if he/she wants to do it again. If the user types “y” or “Y”, the program repeat; if the user types anything else, the program terminates. If the user enters an illegal character, prompt the use to try again.
```asm
.MODEL SMALL
.STACK 64
;------------------------------------
.DATA
CR EQU 0DH
LF EQU 0AH
M1 DB CR,LF,'ENTER A HEXA DIGIT :','$'
M2 DB CR,LF,'IN DECIMAL IT IS :'
C1 DB ?,'$'
M3 DB CR,LF,'DO YOU WANT TO DO IT AGAIN ?'
DB 'Y/N','$'
M4 DB CR,LF,'ILLEGAL CHARACTER - ENTER'
DB '0..9OR A..F :','$'
M5 DB CR,LF,'IN DECIMAL IT IS :1'
C2 DB ?,'$'
;-----------------------------------
.CODE
MAIN PROC
MOV AX,@DATA ;Initialize DS
MOV DS,AX
BEGIN: MOV AH,9
LEA DX,M1
INT 21H
;--------
NEW: MOV AH,1 ;read hexa digit
INT 21H
;--------

CMP AL,'0' ;detictive for errors
JL ILLEGAL
CMP AL,'9'
JG ILLEGAL
;--------
MOV C1,AL
MOV AH,9
LEA DX,M2
INT 21H
;--------
MSG: MOV AH,9 ; do you want to do it again
LEA DX,M3
INT 21H
;---------
MOV AH,1 ; yes or no
INT 21H
CMP AL,'Y'
JE BEGIN
CMP AL,'y'
JE BEGIN
JMP ENDD ;any char. else go out
;---------
ILLEGAL: CMP AL,'A' ; detictive for letter error
JL ILLEGAL2
CMP AL,'F'
JG ILLEGAL2
SUB AL,11H
MOV C2,AL
;--------
MOV AH,9

LEA DX,M5
INT 21H
;---------
JMP MSG
;--------
ILLEGAL2: MOV AH,9
LEA DX,M4
INT 21H
JMP NEW
ENDD: MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN

```
### 9
```asm

```



### input String
```asm
org 100h

;Variables
age db ?

; showing message to enput name 
	mov ah,09h
	mov dx,offset msg
	int 21h 

;enter name
  	MOV  AH, 01h            ;function to input a string
	LEA  DX, username       ;ready to accept name
	INT  21H               ;take user name

; print new line 
MOV AH,2
MOV DL,0DH
INT 21H
MOV DL,0AH
INT 21H


; showing message to enput age
	mov ah,9
	mov dx,offset msg2
	int 21h 

;input age and save in variable age
mov ah,1    ;input function
int 21h
mov bl,al ;save the value from input

; print new line 
MOV AH,2
MOV DL,0DH
INT 21H
MOV DL,0AH
INT 21H

;function to output a string ,here the name will be print 
MOV  AH, 09H           
LEA  DX, username+2   ;load the address of the string  <<< Skip first two chars
INT  21H             ;print string 

; print new line 
MOV AH,2
MOV DL,0DH
INT 21H
MOV DL,0AH
INT 21H


;function to output a int,here the age will be print 
mov ah,2
mov dl,age 
int 21h


msg db "Enter  Your Name : $"
msg2 db "Enter  Your Age: $"

username   DB  16 DUP('$')

```
