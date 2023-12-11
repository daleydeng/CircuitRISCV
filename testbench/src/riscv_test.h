#ifndef RISCV_TEST_H
#define RISCV_TEST_H
#define __riscv_xlen 32
#define DATAREG gp  //x3
#define TMPREG x27
#define TMPREG2 x28
#define RETREG x29
#define TESTNUM x30
#define TESTSEC x31

#define CALL(fn) jal RETREG, fn
#define RET jr RETREG

#define RVTEST(label) CALL(test_##label)

#define RVTEST_CODE_BEGIN(label) \
.global test_##label; \
test_##label:

#define RVTEST_CODE_END \
  addi TESTSEC, TESTSEC, 1; \
  RET; \
fail: \
  j fail;

#include "test_macros.h"

#endif