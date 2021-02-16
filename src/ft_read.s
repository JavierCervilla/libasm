;------------------------------------------------------------------------
;   <ft_read.s>
;------------------------------------------------------------------------
;   ssize_t read(int fd, void *buf, size_t count);
;       ·input: 
;           · int fd: file descriptor donde leer.
;           · const void *buf: donde guarda lo que lee.
;           · size_t count: numero de bytes a leer.
;       ·return:
;           · size_t : numero de bytes leidos:
;               · -1 en error.
;------------------------------------------------------------------------
;   author: <jcervill>  <jcervill@student.42madrid.com>
;------------------------------------------------------------------------

            section .text
            global _ft_read
            extern ___error
    _ft_read:
            mov     rax, 0x2000003
            syscall
            jc      error
            ret
    error:
            push    rax
            call    ___error
            mov     rdi, rax
            pop     rax
            mov     [rdi],  rax
            mov     rax, -1
            ret