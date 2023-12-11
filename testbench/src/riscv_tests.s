#include "riscv_test.h"
#include "test_macros.h"

.section .text
.global _start

_start: 
  la gp, .rodata;

  CALL(init);

  li TESTNUM, 0;
  li TESTSEC, 0;

  # Arith
  # R Type 10 instructions
  RVTEST(add);
  RVTEST(sub);
  RVTEST(xor);
  RVTEST(or);
  RVTEST(and);
  RVTEST(sll);
  RVTEST(srl);
  RVTEST(sra);
  RVTEST(slt);
  RVTEST(sltu);

  # Arith
  # I type 9 instructions
  RVTEST(addi);
  RVTEST(xori);
  RVTEST(ori);
  RVTEST(andi);
  RVTEST(slli);
  RVTEST(srli);
  RVTEST(srai);
  RVTEST(slti);
  RVTEST(sltiu);

  # Branch
  # B type 6 instructions
  RVTEST(beq);
  RVTEST(bne);
  RVTEST(blt);
  RVTEST(bge);
  RVTEST(bltu);
  RVTEST(bgeu);

  # Load
  # I type 5 instructions
  RVTEST(lb);
  RVTEST(lbu);
  RVTEST(lh);
  RVTEST(lhu);
  RVTEST(lw);

  # Store
  # S type 3 instructions
  RVTEST(sb);
  RVTEST(sh);
  RVTEST(sw);

  # Jump
  # J type 1 instruction
  RVTEST(jal);
  # I type 1 instruction
  RVTEST(jalr);

  # Upper
  # U type 2 instruction
  RVTEST(lui);
  RVTEST(auipc);

  addi TESTSEC, TESTSEC, 0x100
LOOP: j LOOP

.section .rodata
.section .data