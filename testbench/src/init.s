
    #include "riscv_test.h"
    #include "test_macros.h"

    .global init
    init:
la TMPREG2, .data;
li TMPREG, 0x0ff000ff;
sw TMPREG, 0(TMPREG2);
li TMPREG, 0x00000000;
sw TMPREG, 4(TMPREG2);
li TMPREG, 0x00000000;
sw TMPREG, 8(TMPREG2);
li TMPREG, 0x00000000;
sw TMPREG, 12(TMPREG2);
li TMPREG, 0x0ff000ff;
sw TMPREG, 16(TMPREG2);
li TMPREG, 0x00000000;
sw TMPREG, 20(TMPREG2);
li TMPREG, 0x00000000;
sw TMPREG, 24(TMPREG2);
li TMPREG, 0x00000000;
sw TMPREG, 28(TMPREG2);
li TMPREG, 0xff0000ff;
sw TMPREG, 32(TMPREG2);
li TMPREG, 0xf00f0ff0;
sw TMPREG, 36(TMPREG2);
li TMPREG, 0x00000000;
sw TMPREG, 40(TMPREG2);
li TMPREG, 0x00000000;
sw TMPREG, 44(TMPREG2);
li TMPREG, 0xff0000ff;
sw TMPREG, 48(TMPREG2);
li TMPREG, 0xf00f0ff0;
sw TMPREG, 52(TMPREG2);
li TMPREG, 0x00000000;
sw TMPREG, 56(TMPREG2);
li TMPREG, 0x00000000;
sw TMPREG, 60(TMPREG2);
li TMPREG, 0x00ff00ff;
sw TMPREG, 64(TMPREG2);
li TMPREG, 0xff00ff00;
sw TMPREG, 68(TMPREG2);
li TMPREG, 0x0ff00ff0;
sw TMPREG, 72(TMPREG2);
li TMPREG, 0xf00ff00f;
sw TMPREG, 76(TMPREG2);
li TMPREG, 0xefefefef;
sw TMPREG, 80(TMPREG2);
li TMPREG, 0xefefefef;
sw TMPREG, 84(TMPREG2);
li TMPREG, 0x0000efef;
sw TMPREG, 88(TMPREG2);
li TMPREG, 0x00000000;
sw TMPREG, 92(TMPREG2);
li TMPREG, 0xbeefbeef;
sw TMPREG, 96(TMPREG2);
li TMPREG, 0xbeefbeef;
sw TMPREG, 100(TMPREG2);
li TMPREG, 0xbeefbeef;
sw TMPREG, 104(TMPREG2);
li TMPREG, 0xbeefbeef;
sw TMPREG, 108(TMPREG2);
li TMPREG, 0xbeefbeef;
sw TMPREG, 112(TMPREG2);
li TMPREG, 0x00000000;
sw TMPREG, 116(TMPREG2);
li TMPREG, 0x00000000;
sw TMPREG, 120(TMPREG2);
li TMPREG, 0x00000000;
sw TMPREG, 124(TMPREG2);
li TMPREG, 0xdeadbeef;
sw TMPREG, 128(TMPREG2);
li TMPREG, 0xdeadbeef;
sw TMPREG, 132(TMPREG2);
li TMPREG, 0xdeadbeef;
sw TMPREG, 136(TMPREG2);
li TMPREG, 0xdeadbeef;
sw TMPREG, 140(TMPREG2);
li TMPREG, 0xdeadbeef;
sw TMPREG, 144(TMPREG2);
li TMPREG, 0xdeadbeef;
sw TMPREG, 148(TMPREG2);
li TMPREG, 0xdeadbeef;
sw TMPREG, 152(TMPREG2);
li TMPREG, 0xdeadbeef;
sw TMPREG, 156(TMPREG2);
li TMPREG, 0xdeadbeef;
sw TMPREG, 160(TMPREG2);
li TMPREG, 0xdeadbeef;
sw TMPREG, 164(TMPREG2);
RET
