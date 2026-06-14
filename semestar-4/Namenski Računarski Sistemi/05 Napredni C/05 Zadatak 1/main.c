#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "BitsBuffer.h"

int main(void)
{
    bits_buffer buffer;
    char poruka[] = "0100100111100";

    init_buff(&buffer);

    for(int i = 0; i < strlen(poruka); i++)
        push(&buffer, poruka[i] - '0');

    while(!isEmpty(buffer))
        printf("%d", pop(&buffer));

    return 0;
}