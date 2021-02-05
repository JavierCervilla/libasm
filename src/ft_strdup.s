;-------------------------------------------------------------------------
;	char	*ft_strdup(char *s);
;	·inputs:
;		·char *s : cadena de caracteres a duplicar
;	·return:
;     char *str : puntero a direccion de memoria donde
;   		esta la copia de s
;   author: <jcervill>  <jcervill@student.42madrid.com>
;------------------------------------------------------------------------
;   author: <jcervill>  <jcervill@student.42madrid.com>
;-------------------------------------------------------------------------

extern _malloc
extern _ft_strlen
extern _ft_strcpy
            section .text
            global _ft_strdup
_ft_strdup:
            xor     rax, rax
            call _ft_strlen
            push    rdi             ; subimos la (input *s) de rdi al stack.
            mov     rdi, rax        ; | len = rax = rdi (sizeof(*s))     |
            inc     rdi             ; | rdi++ (para el espacio del '\0') |
            call _malloc            ; llamamos a _malloc que lo hemos incluido en enuestro archivo.
            pop     rdi             ; recuperamos del stack el contenido de *s.
            mov     rsi, rdi        ; | char *s = rsi = *src   |
            mov     rdi, rax        ; | char *dst = rax = *dst |
            call _ft_strcpy         ;  rax = char *ft_strcpy(char *dst = rdi, char *src = rsi);
            ret                     ; retornamos rax con el string copiado en un nuevo espacio de memoria
