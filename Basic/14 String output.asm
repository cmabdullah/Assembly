org 100h
.stack 100h
.model small               
.data
    m db "hello$"
    
    
.code
    mov ah,9 ; string output
    lea dx,m
    int 21h