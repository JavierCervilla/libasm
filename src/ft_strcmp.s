;------------------------------------------------------------------------
;   <ft_strcmp.s>
;------------------------------------------------------------------------
;   int ft_strcmp(const char *s1 = rdi, const char *s2 = rsi);
;       ·inputs:
;           ·char *s1 : cadena de caracteres 1
;           ·char *s2 : cadena de caracteres 2
;       ·return:
;           ·int rtn : diferencia entre primeros dos caracteres distintos
;             de s1 y s2.
;------------------------------------------------------------------------
;   author: <jcervill>  <jcervill@student.42madrid.com>
;------------------------------------------------------------------------

            section .text
            global _ft_strcmp
_ft_strcmp:
            xor     rax, rax
            mov     rcx, -1
            cmp     rdi, 0
            je      _null
            cmp     rsi, 0
            je      _null
    _while:
            inc     rcx
            cmp     BYTE[rdi + rcx], 0
            je      _end
            cmp     BYTE[rsi + rcx], 0
            je      _end
    _cmp:
            movzx   rax, BYTE[rdi + rcx]
            movzx   rbx, BYTE[rsi + rcx]
            sub     rax, rbx
            cmp     rax, 0
            je      _while
            jne     _end
    _end:
            movzx   rax, BYTE[rdi + rcx]
            movzx   rbx, BYTE[rsi + rcx]
            sub     rax, rbx
            cmp     rax, 128
            jge     _neg
    _null:
            ret
    _neg:
            neg     al
            ret