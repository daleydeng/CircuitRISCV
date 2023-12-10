#ifndef RISCV_TEST_H
#define RISCV_TEST_H
#define __riscv_xlen 32
#define DATAREG gp  //x3
#define RETREG x29
#define TESTNUM x30
#define TESTSEC x31

#define RVTEST(label) jal RETREG, test_##label

#define RVTEST_CODE_BEGIN(label) \
.global test_##label; \
test_##label:

#define RVTEST_CODE_END \
  addi TESTSEC, TESTSEC, 1; \
  jr RETREG; \
fail: \
  j fail;

#endif