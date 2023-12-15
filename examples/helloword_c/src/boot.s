.equ TTY_BASE, 0x100
.equ TTY_ADDR_PUTCHAR, TTY_BASE
.equ TTY_SET_ENABLE, TTY_BASE + 1
.equ TTY_CLEAR,TTY_BASE + 2

.section .text
.global _start

_start:
    la sp, .stack;
    la gp, .rodata
    li a0, 0

    call boot
    call main

IDLE: j IDLE

.globl _putchar
_putchar:
    li t0, TTY_ADDR_PUTCHAR
    sb a0, 0(t0)
    ret

.globl puts
puts:
    addi sp, sp, -8
    sw ra, 0(sp)
    sw s0, 4(sp)

    lb t0, 0(a0)
    beqz t0, _puts_done

_puts_loop:
    mv s0, a0
    mv a0, t0
    call _putchar
    mv a0, s0
    addi a0, a0, 1
    lb t0, 0(a0)
    bnez t0, _puts_loop

_puts_done:
    lw s0, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 8
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

boot:
  la t1, .text_end        # t1: data location in disk
  la t2, .rodata          # t2: mem data start
  
  la t3, .data_end
  la t4, .rodata
  sub t3, t3, t4          # t3: data length
  beqz t3, _boot_ret # check length

_boot_load:
  lw t4, 0(t1)
  sw t4, 0(t2)
  addi t1, t1, 4
  addi t2, t2, 4
  addi t3, t3, -4
  bgtz t3, _boot_load

_boot_ret:
  ret

.globl __umodsi3
__umodsi3:
.globl __udivsi3 
__udivsi3:
.global __umoddi3
__umoddi3:
.global __udivdi3
__udivdi3:


.section .rodata