
    #include "riscv_test.h"
    #include "test_macros.h"

    .global init
    init:
li TMPREG, 0x00ff00ff;
sw TMPREG, 0(gp);
li TMPREG, 0xff00ff00;
sw TMPREG, 4(gp);
la TMPREG2, .data;
RET
