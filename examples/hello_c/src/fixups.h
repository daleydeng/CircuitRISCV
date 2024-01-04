#ifndef FIXUPS_H
#define FIXUPS_H
#include <stdint.h>

uint32_t __mulsi3 (uint32_t a, uint32_t b);
uint32_t __udivsi3 (uint32_t a, uint32_t b);
uint32_t __umodsi3 (uint32_t a, uint32_t b);
uint64_t __umoddi3(uint64_t a, uint64_t b);
uint64_t __udivdi3(uint64_t a, uint64_t b);

#endif