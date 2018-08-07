# 

### 8
```asm
.MODEL SMALL
.CODE
MAIN PROC
MOV AH,2
MOV DL,'?'
INT 21H ;display ‘?’
MOV AH,1
INT 21H ; read 1st char. & put it in BL
MOV BL,AL
INT 21H ;read 2nd char. in AL
;--------------------------
CMP BL,AL
JG SWITCH ;if not orderd
JMP DISPLAY
SWITCH: XCHG AL,BL
DISPLAY:
MOV AH,2
MOV DL, 0AH ;enter
INT 21H
MOV DL,BL
INT 21H
MOV DL,AL
INT 21H
OUT_: MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN
```

### 9
```asm
.MODEL SMALL
.CODE
MAIN PROC
;BH counter (10 char per line)
MOV BH,0
MOV AH,2
MOV CX,7FH ; 127 char.
MOV DL,80H ;1ST letter
MOV BL,80H
CONTINUE: MOV DL,BL
INT 21H
DEC CX
INC DL
MOV BL,DL
MOV DL,20H ;blank space
INT 21H
INC BH
CMP BH,10
JE COUNT
CMP CX,0
JNE CONTINUE ;is letter finished?
JMP out_
COUNT: MOV BH,0 ;start again counter
MOV DL,0AH ;enter
INT 21H
MOV DL,0DH
INT 21H    
JMP CONTINUE
Out_: MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN
```

### 10
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

### 11
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
M4 DB CR,LF,'ILLEGAL CHARACTER – ENTER '
DB '0..9 OR A..F :','$'
M5 DB CR,LF,'IN DECIMAL IT IS :1'
C2 DB ?,'$'
M6 DB CR,LF,'ERROR THREE TIMES ENTERD'
DB 'ILLEGAL CHAR !','$'
;-----------------------------------
.CODE
MAIN PROC
MOV AX,@DATA ;INITIALIZE DS
MOV DS,AX
;------
BEGIN: MOV BL,0 ;counter for error
MOV AH,9
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
MSG: MOV AH,9
LEA DX,M3
INT 21H
;---------
MOV AH,1 ;do u want to do it again
INT 21H
CMP AL,'Y'
JE BEGIN
CMP AL,'y'
JE BEGIN
JMP ENDD
;---------
ILLEGAL: CMP AL,'A'
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
; counter for 3-times illegal input
INC BL
CMP BL,3
JE ENDDD
JMP NEW
ENDDD: MOV AH,9
LEA DX,M6
INT 21H
ENDD: MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN
```

### 8
```asm

```

