;------------------------------------------------------------------------
;   <ft_strcpy.s>
;------------------------------------------------------------------------
;   char *ft_strcpy(char *dst = rdi, char *src = rsi);
;       ·inputs:
;           ·char *dst : cadena de destino donde se va a copiar src
;           ·char *src : cadena de origen, a copiar en dst
;       ·return:
;           ·char *dst : una vez copiado src a dst retorna dst
;------------------------------------------------------------------------
;   author: <jcervill>  <jcervill@student.42madrid.com>
;-------------------------------------------------------------------------

            section .text
            global _ft_strcpy
_ft_strcpy:
            xor     rax, rax
            xor     rcx, rcx
            cmp     rsi, 0
            je      _null
    _while:
            cmp     BYTE[rsi + rcx], 0
            je      _null
    _copy:
            mov     al, BYTE[rsi + rcx]
            mov     BYTE[rdi + rcx], al
            inc     rcx
            jmp     _while
    _null:
            mov     al, BYTE[rsi + rcx]
            mov     BYTE[rdi + rcx], al
            mov     rax, rdi
            ret
