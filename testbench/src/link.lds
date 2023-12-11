OUTPUT_ARCH( "riscv" )
ENTRY(_start)

SECTIONS
{
  . = 0x80000000;
  .text : { *(.text) }
  .rodata : { *(.rodata) }
  /* . = ALIGN(0x1000); */ /* for debugging, remove the gap */
  . += 0x10; /* small gap */
  .data : { *(.data) }
  .bss : { *(.bss) }
  . += 0x4000;
  .stack = .;
  _end = .;
}