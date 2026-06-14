#include <stdio.h>
#include "BitsBuffer.h"

int next(int x)
{
    return (x % BITS_SIZE);
}

void init_buff(bits_buffer *buffer)
{
    buffer -> count =  0;
    buffer -> first = -1;
    buffer -> last  = -1;
}

int isEmpty(bits_buffer buffer)
{
    return buffer.count == 0;
}

int isFull(bits_buffer buffer)
{
    return buffer.count == BITS_SIZE;
}

void setBit(char *ch, int bit_index, int num)
{
    int mask = 0x80 >> bit_index;

    if(num == 0)
        *ch = (*ch) & ~mask;
    else
        *ch = (*ch) | mask;
}

int isSetBit(char ch, int bit_index)
{
    int mask = 0x80 >> bit_index;

    return (ch & mask) != 0;
}

void push(bits_buffer *buffer, int num)
{
    if(buffer -> count == BITS_SIZE)
    {
        printf("\nBuffer je pun!\n");
        return;
    }
    else if(buffer -> count == 0)
    {
        buffer -> first = 0;
        buffer -> last  = 0;
    }
    else
        buffer -> last++;

    buffer -> count++;

    int index     = buffer -> last;
    int bit_index = buffer -> last;

    index >>= 3;       // deljenje sa 2^3 = 8
    bit_index &= 0x07; // ostatak pri deljenju sa 9

    setBit(&buffer -> buffer[index], bit_index, num);
}

int pop(bits_buffer *buffer)
{
    if(buffer -> count == 0)
    {
        printf("\nBuffer je prazan!\n");
        return 0;
    }
    else
    {
        int index = buffer -> first;
        int bit_index = buffer -> first % 8;

        index >>= 3;       // deljenje sa 2^3 = 8
        bit_index &= 0x07; // ostatak pri deljenju sa 9

        int bit = isSetBit(buffer -> buffer[index], bit_index);
        buffer -> count--;

        if(buffer -> count == 0)
        {
            buffer -> first = 0;
            buffer -> last  = 0;
        }
        else
        {
            buffer -> first++;
        }

        return bit;
    }
}
