.text
.global _start
_start: 
    la sp, .stack;
    la gp, .rodata;

    call init_data;

    li a0, 0x1;
    call tty_set_enable;
    li a0, 0x1;
    call kb_set_enable;

    la a0, say_str;
    call puts;

    
    # call clear_tty;
    # li a0, 0x0;
    # call tty_set_enable;
_repeat: 
    call getchar;
    call putchar;
    addi t0, a0, -99; // c
    beqz t0, _clear_tty;
_after_key_c:
    addi t0, a0, -113; // q
    bnez t0, _repeat;
    j wait;
    
_clear_tty:
    call clear_tty;
    j _after_key_c;

wait: j wait;

init_data: // hack
    li t0, 'h';
    sb t0, 0(gp);
    li t0, 'e';
    sb t0, 1(gp);
    li t0, 'l';
    sb t0, 2(gp);
    li t0, 'l';
    sb t0, 3(gp);
    li t0, 'o';
    sb t0, 4(gp);
    li t0, ' ';
    sb t0, 5(gp);
    li t0, 'w';
    sb t0, 6(gp);
    li t0, 'o';
    sb t0, 7(gp);
    li t0, 'r';
    sb t0, 8(gp);
    li t0, 'l';
    sb t0, 9(gp);
    li t0, 'd';
    sb t0, 10(gp);
    ret

putchar:
    li t0, 0x1000
    sb a0, 0(t0)
    ret

puts:
    addi sp, sp, -8;
    sw ra, 0(sp);
    sw s0, 4(sp);

    lb t0, 0(a0);
    beqz t0, _puts_done;

_puts_loop:
    mv s0, a0;
    mv a0, t0;
    call putchar;
    mv a0, s0;
    addi a0, a0, 1;
    lb t0, 0(a0);
    bnez t0, _puts_loop;

_puts_done:
    lw s0, 4(sp);
    lw ra, 0(sp);
    addi sp, sp, 8;
    ret;

tty_set_enable:
    li t0, 0x1001
    mv t1, a0
    sb t1, 0(t0)
    ret

clear_tty:
    li t0, 0x1002
    li t1, 0x1
    sb t1, 0(t0)
    ret

kb_set_enable:
    li t0, 0x2001
    mv t1, a0
    sb t1, 0(t0)
    ret

getchar:
    addi sp, sp, -8;
    sw ra, 0(sp);
    sw s0, 4(sp);

    li t0, 0x2000;

_getchar_loop:
    lb a0, 0(t0)
    beqz a0, _getchar_loop;
    andi s0, a0, 0b01111111
    
    call pop_kb;
    
    mv a0, s0;
    lw s0, 4(sp);
    lw ra, 0(sp);
    addi sp, sp, 8;
    ret

pop_kb:
    li t0, 0x2002
    li a0, 1;
    sb a0, 0(t0);
    li a0, 0;
    sb a0, 0(t0);
    ret 

clear_kb:
    li t0, 0x2003
    li a0, 1;
    sb a0, 0(t0);
    ret

.rodata:
say_str: .asciz "hello world!"