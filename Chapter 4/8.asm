.MODEL SMALL
.DATA
MSG DB 0AH,0DH,'THE SUM OF '
C1 DB ?,' AND '
C2 DB ?,' IS '
SUM DB ?,'$'
.CODE
Main PROC
MOV AX,@DATA ; initialize DS
MOV DS,AX
MOV AH,2 ; display ‘?’
MOV DL,'?'
INT 21H
MOV AH,1
INT 21H ; read 1st digit

MOV C1,AL ; store it in memory
INT 21H ; read 2nd digit
MOV C2,AL ; store it in memory 
ADD AL,C1 ; add the two numbers
SUB AL,30H ; *
MOV SUM,AL ; store result in memory
LEA DX,MSG ; get the start address
MOV AH,9
INT 21H ; print the MSG until $
MOV AH,4CH ;return to DOS
INT 21H
Main ENDP
END Main