.MODEL SMALL
.DATA
MSG DB 0AH,0DH,'ENTER A HEX DIGIT: $'
MSG2 DB 0AH,0DH,'IN DECIMAL IT IS 1'
C1 DB ?,'$'
.CODE
MAIN PROC
MOV AX,@DATA ;initialize DS
MOV DS,AX
MOV AH,9 ; display 1st MSG
LEA DX,MSG
INT 21H
MOV AH,1 ; read hex digit (A � F)
INT 21H
SUB AL,11H ;*
MOV C1,AL ;store it
MOV AH,9 ;display 2nd MSG until $
LEA DX,MSG2
INT 21H   


MOV AH,4CH ; return to DOS
INT 21H
MAIN ENDP
END MAIN