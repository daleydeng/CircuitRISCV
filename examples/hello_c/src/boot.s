.equ TTY_BASE, 0x100
.equ TTY_ADDR_PUTCHAR, TTY_BASE
.equ TTY_SET_ENABLE, TTY_BASE + 1
.equ TTY_CLEAR,TTY_BASE + 2

.global rv_memcpy

.section .text
.global _start

_start:
    la sp, .stack;
    la gp, .rodata

    # call boot

    la a0, .rodata
    la a1, .text_end
    la a2, .data_end
    sub a2, a2, a0
    call rv_memcpy

    call main

IDLE: j IDLE

.globl _putchar
_putchar:
    li t0, TTY_ADDR_PUTCHAR
    sb a0, 0(t0)
    ret

.globl tty_set_enable
tty_set_enable:
    li t0, TTY_SET_ENABLE
    mv t1, a0
    sb t1, 0(t0)
    ret

clear_tty:
    li t0, TTY_CLEAR
    li t1, 0x1
    sb t1, 0(t0)
    ret

.section .rodata