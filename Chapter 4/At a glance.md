# 

### 7 a
```asm
	MOV AH,1
	INT 21H
	MOV DL,AL
	MOV AH,2
	INT 21H
```


### 7 b
```asm
	MOV AH,1
	INT 21H
	ADD AL,20H ;convert to lower case
	MOV DL,AL
	MOV AH,2
	INT 21H
```
### 8
```asm
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
```
### 9
```asm
.MODEL SMALL
.DATA
	MSG DB 0AH,0DH,"ENTER THREE INITIALS: $"
	C1 DB ?,0AH,0DH
	C2 DB ?,0AH,0DH
	C3 DB ?,'$'
.CODE
MAIN PROC
	MOV AX,@DATA ;initialze DS
	MOV DS,AX
	MOV AH,9 ; display MSG
	LEA DX,MSG
	INT 21H

	MOV AH,1 ; read & store 1st char.
	INT 21H
	MOV C1,AL
	INT 21H ; read & store 2nd char.
	MOV C2,AL
	INT 21H ; read & store 3rd char.
	MOV C3,AL


	MOV AH,2 ; display enter
	MOV DL,0AH
	INT 21H
	MOV DL,0DH
	INT 21H
	MOV AH,9 ; display message from c1 until $
	LEA DX,C1
	INT 21H
	MOV AH,4CH ; return to DOS
	INT 21H
MAIN ENDP
END MAIN
```
### 10
```asm
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
	MOV AH,1 ; read hex digit (A – F)
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
```
### 11
```asm
.MODEL SMALL
.DATA
	STARS DB 0AH,0DH,'**********','$'
.CODE
MAIN PROC
	MOV AX,@DATA ;initialize DS
	MOV DS,AX
	MOV AH,9 ; prepare to display
	LEA DX,STARS
	INT 21H ; display 10 times *
	INT 21H
	INT 21H
	INT 21H
	INT 21H
	INT 21H
	INT 21H
	INT 21H
	INT 21H
	INT 21H    


	MOV AH,4CH ;return to DOS
	INT 21H
MAIN ENDP
END MAIN    



;* it will be easy after study loop statement ch.6 to replace
;10 statement by the code :
;MOV CX,10
;L: INT 21H
;LOOP L
```
### 12
```asm
.MODEL SMALL
.DATA
	STARS DB ,'***********',0AH,0DH,'$'
	MID DB ' *** '
	C1 DB ?
	C2 DB ?
	C3 DB ?,' ***',0AH,0DH,'$'
.CODE
MAIN PROC
	MOV AX,@DATA ; initialize DS
	MOV DS,AX
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

	MOV AH,9 ;( display stars from the
	; beginning of line that will
	;cause to erase the 3 initial
	;and write over them)
	LEA DX,STARS
	INT 21H
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
	INT 21H
	MOV AH,4CH ; return to DOS
	INT 21H
MAIN ENDP
END MAIN
```

