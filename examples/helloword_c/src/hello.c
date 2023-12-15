
#include "printf.h"

char *msg = "LOOP: hello world!\n";

void print_number(int i)
{
    _putchar('0' + i);
}

int strlen(char *s)
{
    char *c = s;
    int i = 0;
    while (*c++)
    {
        i++;
    }
    return i;
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

    int l = strlen(msg);
    for (int i = 0; i < l; i++)
    {
        _putchar(msg[i]);
    }
    printf("PRINTF: hello from %s!\n", "C");

    tty_set_enable(0);
}