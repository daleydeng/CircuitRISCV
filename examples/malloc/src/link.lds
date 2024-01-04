OUTPUT_ARCH( "riscv" )
ENTRY(_start)

SECTIONS
{
  INIT_PC = 0x00001000;
  . = INIT_PC;
  .text_start = .;
  .text : { *(.text) }
  . += 0x04;
  .text_end = .;

  . = ALIGN(0x2000);
  .rodata_start = .;
  .rodata : { *(.rodata) }
  . = ALIGN(4);
  .rodata_end = .;

  .data_start = .;
  .data : { 
    *(.data) 
    *(.sdata)
  }
  . = ALIGN(4);
  .data_end = .;
  PROVIDE(_HEAP_START = . + 4);
  PROVIDE(_HEAP_END = _HEAP_START + 0x1000);
  
  . = ALIGN(0x4000);
  .stack = .;
}