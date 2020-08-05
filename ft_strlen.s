;------------------------------------------------------------------------
;   <ft_strlen.s>
;------------------------------------------------------------------------
;   size_t ft_strlen(char *s)
;       ·input: Sting
;       ·return:
;           ·if(!s)->ret(0);
;           ·ret(len(s))
;   author: <jcervill>  <jcervill@student.42madrid.com>
;------------------------------------------------------------------------

            section .text
            global _ft_strlen
_ft_strlen:
            xor     rax, rax
            cmp     rdi, 0
            je      _null
            jne     _while
    _while:
            cmp     BYTE[rdi + rax], 0
            je      _null
            jne     _count
    _count:
            inc     rax
            jmp     _while
    _null:
            ret