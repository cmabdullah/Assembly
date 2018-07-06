MOV AH,1
INT 21H
ADD AL,20H ;convert to lower case
MOV DL,AL
MOV AH,2
INT 21H