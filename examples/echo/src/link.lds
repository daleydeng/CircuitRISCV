OUTPUT_ARCH( "riscv" )
ENTRY(_start)

SECTIONS
{
  . = 0x80000000;
  .text : { *(.text) }
  .rodata : { *(.rodata) }
  . = ALIGN(0x1000);
  .data : { *(.data) }
  .bss : { *(.bss) }
  . += 0x4000;
  .stack = .;
  _end = .;
}