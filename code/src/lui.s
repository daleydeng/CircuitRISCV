#include "riscv_test.h"
#include "test_macros.h"

RVTEST_CODE_BEGIN(lui)

  #-------------------------------------------------------------
  # Basic tests
  #-------------------------------------------------------------

  TEST_CASE( 2, x1, 0x0000000000000000, lui x1, 0x00000 );
  TEST_CASE( 3, x1, 0xfffffffffffff800, lui x1, 0xfffff;sra x1,x1,1);
  TEST_CASE( 4, x1, 0x00000000000007ff, lui x1, 0x7ffff;sra x1,x1,20);
  TEST_CASE( 5, x1, 0xfffffffffffff800, lui x1, 0x80000;sra x1,x1,20);

  TEST_CASE( 6, x0, 0, lui x0, 0x80000 );

RVTEST_CODE_END
