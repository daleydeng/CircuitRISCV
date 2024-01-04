
#include <string.h>
#include "printf.h"

char *msg_putchar = "_putchar: hello world!\n";
char *msg_puts = "puts: hello world!\n";

void print_number(int i)
{
    _putchar('0' + i);
}

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
    _putchar('C');
    _putchar('H');
    _putchar('A');
    _putchar('R');
    _putchar(':');
    _putchar('H');
    _putchar('E');
    _putchar('L');
    _putchar('L');
    _putchar('O');
    _putchar('!');
    _putchar('\n');

    int l = rv_strlen(msg_putchar);
    for (int i = 0; i < l; i++)
    {
        _putchar(msg_putchar[i]);
    }

    rv_puts(msg_puts);

    printf("PRINTF: hello from %s!\n", "C");

    tty_set_enable(0);
}