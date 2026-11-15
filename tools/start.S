    .section .text.start,"ax",@progbits
    .option norvc
    .option norelax
    .globl _start
    .type _start, @function
_start:
    la sp, __stack_top
    la t0, __bss_start
    la t1, __bss_end

.Lclear_bss:
    bgeu t0, t1, .Lcall_main
    sw zero, 0(t0)
    addi t0, t0, 4
    j .Lclear_bss

.Lcall_main:
    call main

    .globl program_done
program_done:
    slli a0, a0, 1
    ori a0, a0, 1
    la t0, tohost
    sw zero, 4(t0)
    sw a0, 0(t0)

.Lhalt:
    j .Lhalt
    .size _start, .-_start

    .section .tohost,"aw",@progbits
    .balign 64
    .globl tohost
    .type tohost, @object
tohost:
    .word 0, 0
    .size tohost, 8

    .balign 64
    .globl fromhost
    .type fromhost, @object
fromhost:
    .word 0, 0
    .size fromhost, 8

    .section .note.GNU-stack,"",@progbits