#include "test_macros.h"

.global _start

_start: 
  li TESTNUM, 0;
  CALL test_add;
  bnez TESTNUM, fail;

  li TESTNUM, 0x100 // 1 means success
fail:
  j fail;