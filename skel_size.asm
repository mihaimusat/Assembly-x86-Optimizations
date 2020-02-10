BITS 32
extern print_line
global mystery1
global mystery2
global mystery3
global mystery4
global mystery5
global mystery6
global mystery7
global mystery8
global mystery9

section .text
mystery1:
    push ebp
    mov ebp, esp
    
    xor ecx, ecx
    
    mov	edi, [ebp+8]
    not	ecx
    xor	al, al
    cld
    repne scasb
    not ecx
    
    lea	eax, [ecx-1]
    
    leave
    ret
    
;;;;;;;;;;;;;;;;;;;;;;;am terminat de optimizat mystery1;;;;;;;;;;;;;;;;;;;;;;;
   
mystery2:
    push ebp
    mov ebp, esp
    
    mov edi, DWORD[ebp+0x8]
    mov dl, BYTE[ebp+0xc]
    xor eax, eax
    
repeta:
    cmp BYTE[edi], dl
    je final
    cmp BYTE[edi], BYTE 0
    je terminator
    add edi, 1
    add eax, 1
    jmp repeta

terminator:
    mov edi, 0x0
    mov eax, 0xffffffff
    
final:
    leave
    ret

;;;;;;;;;;;;;;;;;;;;;;;am terminat de optimizat mystery2;;;;;;;;;;;;;;;;;;;;;;;

mystery3:
    push ebp
    mov ebp, esp
  
    mov ebx, DWORD[ebp+0x8]
    mov edx, DWORD[ebp+0xc]
    mov ecx, DWORD[ebp+0x10]

mystery3_l1:
    mov al, BYTE[ebx]
    mov ah, BYTE[edx]
    cmp al, ah
    jne mystery3_l2
    
    inc ebx
    inc edx
    dec ecx
    jnz mystery3_l1
    
    xor eax, eax
    jmp mystery3_l3

mystery3_l2:
    mov eax, 0x1

mystery3_l3:
    leave  
    ret    

;;;;;;;;;;;;;;;;;;;;;;;am terminat de optimizat mystery3;;;;;;;;;;;;;;;;;;;;;;;
  
mystery4:
    push ebp
    mov ebp, esp
    
    mov eax, DWORD[ebp+0x8]
    mov ebx, DWORD[ebp+0xc]
    mov ecx, DWORD[ebp+0x10]

mystery4_l1:
    mov dl, BYTE[ebx]    
    mov BYTE[eax], dl
    
    inc eax
    inc ebx
    dec ecx    
    jnz mystery4_l1
    
    leave  
    ret    

;;;;;;;;;;;;;;;;;;;;;;;am terminat de optimizat mystery4;;;;;;;;;;;;;;;;;;;;;;;

mystery5:
    push ebp
    mov ebp, esp
  
    mov eax, DWORD[ebp+0x8]
    cmp al, 0x30
    jl mystery5_l1
    cmp al, 0x39
    jg mystery5_l1
    mov eax, 0x1
    jmp mystery5_l2

mystery5_l1:
    mov eax, 0x0

mystery5_l2:
    leave  
    ret    

;;;;;;;;;;;;;;;;;;;;;;;TODO;;;;;;;;;;;;;;;;;;;;;;;

mystery6:
    push ebp
    mov ebp, esp
    
    mov edi, DWORD[ebp+0x8]
    
    xor ecx, ecx

    not	ecx
    xor	al, al
    cld
    repne scasb
    
    not ecx
    
    lea	eax, [ecx-1]

    mov edi, DWORD[ebp+0x8]
    mov ecx, eax

mystery6_l1:
    mov dl, BYTE[edi+ecx-1]
    mov BYTE[ebx], dl
    inc ebx
    dec ecx
    jnz mystery6_l1
    
mystery6_l2:
    mov dl, BYTE[ebx]    
    mov BYTE[eax], dl
    inc eax
    inc ebx
    dec ecx    
    jnz mystery6_l2
    
    leave  
    ret
     

;;;;;;;;;;;;;;;;;;;;;;;TODO;;;;;;;;;;;;;;;;;;;;;;;
 
mystery7:
   push ebp
   mov ebp, esp
       
   xor eax, eax
   mov edi, dword[ebp + 8]

mystery7_l1:   
   mov dl, byte[edi]
   sub dl, 0x30
   cmp dl, 0
   jl mystery7_l2
   cmp dl, 9
   jg mystery7_l2
   imul eax, 10
   add eax, edx
   inc edi
   cmp byte[edi], 0x00
   jne mystery7_l1
    
   leave 
   ret
    
mystery7_l2:
   mov eax, 0xffffffff
   leave
   ret

;;;;;;;;;;;;;;;;;;;;;;;am optimizat mystery7;;;;;;;;;;;;;;;;;;;;;;;

mystery8:
    push ebp
    mov ebp, esp
    mov esi, [ebp + 8]
    mov edi, [ebp + 12]
    mov ecx, [ebp + 16]
    xor ebx, ebx

mystery8_l1:
    cmp ebx, ecx
    jge mystery8_l22

    mov al, BYTE [esi]
    cmp al, 0
    je mystery8_l2

    cmp al, 10
    je mystery8_l2

    mov dl, [edi + ebx]
    cmp dl, al
    je mystery8_l11

    mov ebx, -1

mystery8_l11:
    inc ebx
    inc esi
    jmp mystery8_l1
	
mystery8_l22:
    mov eax, 1
    jmp mystery8_l3

mystery8_l2:
    xor eax, eax

mystery8_l3:
    leave  
    ret    
   
;;;;;;;;;;;;;;;;;;;;;;;am optimizat mystery8;;;;;;;;;;;;;;;;;;;;;;;

mystery9:
    push ebp
    mov ebp, esp
    
    sub esp, 0x14
    
    mov eax, DWORD[ebp+0xc]
    mov DWORD[ebp-0x10], eax
    mov DWORD[ebp-0xc], eax
    
    push DWORD[ebp+0x14]
    call mystery1
    add esp, 0x4
    
    mov DWORD[ebp-0x14], eax

mystery9_l1:
    mov eax, DWORD[ebp-0xc]
    cmp eax, DWORD[ebp+0x10]
    jae mystery9_l2
    
    mov edx, DWORD[ebp+0x8]
    lea eax, [eax + edx]
    
    mov al, BYTE[eax]
    cmp al, 0xa
    jne mystery9_l3
    
    mov eax, DWORD[ebp-0x10]
    lea eax, [eax + edx]
    
    push DWORD[ebp-0x14]
    push DWORD[ebp+0x14]
    push eax
    call mystery8
    add esp, 0xc
    
    test eax, eax
    je mystery9_l4
    
    mov edx, DWORD[ebp+0x8]
    mov eax, DWORD[ebp-0x10]
    lea eax, [eax + edx]
    
    push eax
    call print_line
    add esp, 0x4

mystery9_l4:
    mov eax, DWORD[ebp-0xc]
    inc eax
    mov DWORD[ebp-0x10], eax

mystery9_l3:
    inc DWORD[ebp-0xc]
    jmp mystery9_l1

mystery9_l2:
    leave  
    ret    
;;;;;;;;;;;;;;;;;;;;;;;TODO;;;;;;;;;;;;;;;;;;;;;;;
