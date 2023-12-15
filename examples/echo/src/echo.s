.equ TTY_BASE, 0x100
.equ TTY_ADDR_PUTCHAR, TTY_BASE
.equ TTY_SET_ENABLE, TTY_BASE + 1
.equ TTY_CLEAR,TTY_BASE + 2

.equ KB_BASE, 0x110
.equ KB_GETCHAR, KB_BASE
.equ KB_ENABLE, KB_BASE + 1
.equ KB_POP, KB_BASE + 2
.equ KB_CLEAR, KB_BASE + 3

.equ VID_BASE, 0x120
.equ VID_COLOR, VID_BASE
.equ VID_X_COORD, VID_BASE + 1
.equ VID_Y_COORD, VID_BASE + 2
.equ VID_SET_ENABLE, VID_BASE + 3
.equ VID_CLEAR, VID_BASE + 4

.section .text
.global _start

_start: 
    la sp, .stack
    la gp, .rodata

    call boot

    li a0, 0x1
    call tty_set_enable
    li a0, 0x1
    call kb_set_enable

    la a0, say_st
    call puts

    call vid_test

    # call clear_tty
    # li a0, 0x0
    # call tty_set_enable
_repeat: 
    call getchar
    call putchar
    addi t0, a0, -99 // c
    beqz t0, _clear_tty
_after_key_c:
    addi t0, a0, -113 // q
    bnez t0, _repeat
    j wait
    
_clear_tty:
    call clear_tty
    j _after_key_c

wait: j wait

putchar:
    li t0, TTY_ADDR_PUTCHAR
    sb a0, 0(t0)
    ret

puts:
    addi sp, sp, -8
    sw ra, 0(sp)
    sw s0, 4(sp)

    lb t0, 0(a0)
    beqz t0, _puts_done

_puts_loop:
    mv s0, a0
    mv a0, t0
    call putchar
    mv a0, s0
    addi a0, a0, 1
    lb t0, 0(a0)
    bnez t0, _puts_loop

_puts_done:
    lw s0, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 8
    ret

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

kb_set_enable:
    li t0, KB_ENABLE
    mv t1, a0
    sb t1, 0(t0)
    ret

getchar:
    addi sp, sp, -8
    sw ra, 0(sp)
    sw s0, 4(sp)

    li t0, KB_GETCHAR

_getchar_loop:
    lb a0, 0(t0)
    beqz a0, _getchar_loop
    andi s0, a0, 0b01111111
    
    call pop_kb
    
    mv a0, s0
    lw s0, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 8
    ret

pop_kb:
    li t0, KB_POP
    li a0, 1
    sb a0, 0(t0)
    li a0, 0
    sb a0, 0(t0)
    ret 

clear_kb:
    li t0, KB_CLEAR
    li a0, 1
    sb a0, 0(t0)
    ret

vid_test:
    li a0, VID_SET_ENABLE
    li t0, 1
    sb t0, 0(a0)

    li a0, VID_CLEAR
    li t0, 1
    sb t0, 0(a0)

    li a2, VID_COLOR
    li t0, 0x808080
    sw t0, 0(a2)

    li a0, VID_Y_COORD
    li a1, VID_X_COORD
 
    li t1, 0x50 // x0
    li t2, 0x30 // y0
    li t3, 0x60 // x1
    li t4, 0x80 // y1
    mv t6, t2 // tmp_y

_vid_loop_y:
    sw t6, 0(a0)
    mv t5, t1 // tmp_x
_vid_loop_x:

    sw t5, 0(a1)

    addi t5, t5, 1
    blt t5, t3, _vid_loop_x

    addi t6, t6, 1
    blt t6, t4, _vid_loop_y

    li a0, VID_SET_ENABLE
    li t0, 0
    sb t0, 0(a0)
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

.section .rodata
say_st: .asciz "hello world! me" 
# 68 65 6c 6c 6f 20 77 6f 72 6c 64 21 20 6d 65, 6c6c6568 6f77206f 21646c72 00656d20