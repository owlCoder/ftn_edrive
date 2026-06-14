/// 04 Zadatak 02
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int konverzija(char *string)
{
    int x = 0;
    int n = strlen(string);

    for(int i = n - 1, j = 0; i >= 0; i--)
        x += (string[i] - '0') * pow(2, j++);

    return x;
}

int main(void)
{
    char str[32];

    printf("Unesite binarni broj: ");
    scanf("%s", str);

    printf("BIN: %s --> DEK %d\n", str, konverzija(str));

    return 0;
}
