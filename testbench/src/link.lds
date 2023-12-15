OUTPUT_ARCH( "riscv" )
ENTRY(_start)

SECTIONS
{
  . = 0x1000;
  .text_start = .;
  .text : { *(.text) }
  . += 0x04;
  .text_end = .;

  . = ALIGN(0x2000);
  .rodata_start = .;
  .rodata : { *(.rodata) }
  . = ALIGN(0x4);
  .rodata_end = .;

  .data_start = .;
  .data : { *(.data) }
  . = ALIGN(0x4);
  .data_end = .;

  . += 0x4000;
  .stack = .;

}