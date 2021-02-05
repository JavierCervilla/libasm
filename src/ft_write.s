;------------------------------------------------------------------------
;   <ft_write.s>
;------------------------------------------------------------------------
;   ssize_t write(int fd, const void *buf, size_t count);
;       ·input: 
;           · int fd: file descriptor donde escribir.
;           · const void *buf: lo que va a escribir.
;           · size_t count: numero de bytes a escribir.
;       ·return:
;           · size_t : numero de bytes escritos:
;               · -1 en error.
;------------------------------------------------------------------------
;   author: <jcervill>  <jcervill@student.42madrid.com>
;------------------------------------------------------------------------

            section .text
            global _ft_write
            extern ___error
    _ft_write:
            mov     rax, 0x2000004
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