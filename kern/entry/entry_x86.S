.global common_entry_asm
common_entry_asm:
    /* Save state */
    pushl $0
    pusha
    pushl %ds
    pushl %es

    pushl %esp
    call MANGLEDkernel_entry
    addl $4, %esp

common_exit_asm:
    popl %es
    popl %ds
    popa
    addl $12, %esp

    iret

.global leave_kernel
leave_kernel:
    movl 4(%esp), %esp
    jmp common_exit_asm


/* This is a big hack. */
.global kernel_main
kernel_main:
    jmp MANGLEDkernel_main