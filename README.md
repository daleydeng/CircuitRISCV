#  CircuitRISCV

## Video
- [亲手撸制cpu 之CircuitRISCV logisim](https://www.bilibili.com/video/BV1Lc411B7zD/?share_source=copy_web&vd_source=4e9234e575f4ae61683c56cb1995776a)
- [视频 亲手撸制CPU之 CircuitRISCV II logisim](https://www.bilibili.com/video/BV1HN4y1s7ns/?share_source=copy_web&vd_source=4e9234e575f4ae61683c56cb1995776a)

## Introduction

This project features a RISC-V RV32IM CPU circuit designed in Logisim Evolution specifically for educational purposes.

To open the circuit, please use Logisim Evolution.

![snapshot](https://github.com/daleydeng/CircuitRISCV/raw/main/doc/snapshot.png)

## Features
- Implements unprivileged mode instructions from the rv32im specification.
- Features a unified address space.
- Includes common peripherals such as a terminal, keyboard, and screen.
- Supports RISC-V assembly language.
- Supports C code with printf functionality and a customized malloc implementation.
- Passes the official riscv-tests suite to confirm correctness.

## Requirements

- [SCons](https://scons.org/)  A Python-based software construction tool (Makefile-like) used for project management.
- riscv-none-elf-*: A build toolchain for compiling examples.

## TODO
- Add support for rust::no_std for embedded systems.

(revised by GPT)