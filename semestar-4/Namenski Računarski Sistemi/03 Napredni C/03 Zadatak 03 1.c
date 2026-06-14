/// 03 Zadatak 01
#include <stdio.h>
#include <stdlib.h>

void copyLEToLE(int x, void *copy)
{
    for(int i = 0; i < sizeof(x); i++)
        *((char *) copy + i) = *((char *) &x + i);
}

void copyLEToBE(int x, void *copy)
{
    for(int i = 0; i < sizeof(x); i++)
        *((char *) copy + i) = *((char *) &x + sizeof(x) - 1 - i);
}

int main(void)
{
    int a = 0x12a5f87, aLE, aBE;

    copyLEToLE(a, &aLE);
    copyLEToBE(a, &aBE);

    printf("VREDNOST U LE: 0x%08x\nVREDNOST U BE: 0x%08x\n", aLE, aBE);

    return 0;
}

