;;; -----------------------------------------------------
;;; testLib.asm
;;; D. Thiebaut
;;; Simple demo program for simple I/O operations
;;;
;;; To assemble, link and run:
;;; nasm -f elf 231Lib.asm
;;; nasm -f elf testLib.asm
;;; ld -melf_i386 testLib.o 231Lib.o -o testLib
;;; ./testLib
;;;
;;; Example of output, when user enters 1001 at the keyboard:
;;; x = 127
;;; y = 10000
;;; z = 100000
;;; > 1001
;;; z = 1001
;;; -----------------------------------------------------

;;; extern functions that will be linked to this program
;;; contained in 231Lib.asm

extern  _printDec
extern  _printString
extern  _println
extern  _getInput
        
;;; -----------------------------------------------------
;;; data section
;;; -----------------------------------------------------
        section .data
x       db      127
y       dw      10000
z       dd      100000
msgX    db      "x = "
msgY    db      "y = "
msgZ    db      "z = "
prompt  db      "> "
        
;;; -----------------------------------------------------
;;; code section
;;; -----------------------------------------------------
        section .text
        global _start
_start:

;;; display x
        mov             ecx, msgX
        mov             edx, 4
        call            _printString
        mov             eax, 0
        mov             al, byte[x]
        call            _printDec
        call            _println

;;; display y
        mov             ecx, msgY
        mov             edx, 4
        call            _printString
        mov             eax, 0
        mov             ax, word[y]
        call            _printDec
        call            _println

;;; display z
        mov             ecx, msgZ
        mov             edx, 4
        call            _printString
        mov             eax, dword[z]
        call            _printDec
        call            _println

;;; get number from user
        mov             ecx, prompt
        mov             edx, 2
        call            _printString
        call            _getInput
        mov             dword[z], eax
;;; display it back
        mov             ecx, msgZ
        mov             edx, 4
        call            _printString
        mov             eax, dword[z]
        call            _printDec
        call            _println

;;; ; exit
        mov     ebx, 0
        mov     eax, 1
        int     0x80
