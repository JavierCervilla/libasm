;-------------------------------------------------------------------------
;	char	*ft_strdup(char *s);
;	·inputs:
;		·char *s : cadena de caracteres a duplicar
;	·return:
;     char *str : puntero a direccion de memoria donde
;   		esta la copia de s
;-------------------------------------------------------------------------

extern _malloc
extern _ft_strlen
extern _ft_strcpy
            section .text
            global _ft_strdup
_ft_strdup:
            xor     rax, rax
            call _ft_strlen
            push    rdi
            mov     rdi, rax
            inc     rdi
            call _malloc
            pop     rdi
            mov     rsi, rdi
            mov     rdi, rax
            call _ft_strcpy
            ret
