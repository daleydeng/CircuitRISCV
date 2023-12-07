#!/bin/bash

main := riscv_tests
objs := riscv_tests.o add.o

all: riscv_tests.hex

$(main).hex: $(main).bin
	od -t x4 $^ -A n > $@

$(main).bin: $(objs) src/link.lds
	riscv-none-elf-ld -o $(main) -T src/link.lds $(objs)
	riscv-none-elf-objcopy -O binary $(main) $@

%.o: %.S
	riscv-none-elf-gcc -c $< -march=rv32i -o $@

%.S: src/%.s
	riscv-none-elf-cpp -E $< >$@

clean: 
	rm -rf *.o *.S *.hex *.bin