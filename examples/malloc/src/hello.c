
#include "printf.h"
#include "tinyalloc.h"

extern long _HEAP_START;
extern long _HEAP_END;

int rv_strlen(char *s)
{
    char *c = s;
    int i = 0;
    while (*c++)
    {
        i++;
    }
    return i;
}

void rv_strcpy(char *dst, char *src)
{
  while (*dst++ = *src++);
}

void rv_memcpy(int *dst, int* src, int size) {
    for (int i = 0; i < size; i++) {
        *dst++ = *src++;
    }
}

void rv_puts(char *s) {
    while (1) {
        char c = *s++;
        if (!c)
            break;
        _putchar(c);
    }
}

int main()
{
    tty_set_enable(1);
    ta_init((unsigned char*)&_HEAP_START, (unsigned char*)&_HEAP_END, 256, 16, 4);

    printf("PRINTF: hello from %s!\n", "C");

    char *s = ta_calloc(10, 1);
    rv_strcpy(s, "MALLOC: hello from malloc");
    printf("%s!\n", s);

    ta_free(s);
    tty_set_enable(0);
}