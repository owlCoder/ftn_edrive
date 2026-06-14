#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "BitsBuffer.h"

int main(void)
{
    bits_buffer buffer;
    char poruka[] = "010010000110010101101100011011000110111100100000011101110110111101110010011011000110010000100001";
    char c;

    init_buff(&buffer);

    for(int i = 0; i < strlen(poruka); i++)
        push(&buffer, poruka[i] - '0');

    while(!isEmpty(buffer))
    {
        for(int i = 0; i < 8; i++)
        {
            int num =  pop(&buffer);
            setBit(&c, i, num);
        }
        printf("%c", c);
    }
        
    return 0;
}
