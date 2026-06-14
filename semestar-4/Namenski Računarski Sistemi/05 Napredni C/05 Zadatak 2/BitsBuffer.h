#ifndef BITSBUFFER_H_INCLUDED
#define BITSBUFFER_H_INCLUDED

#define size 1024
#define bitsize 8*size

typedef struct 
{
    char buffer[SIZE];
    int count;
    int first;
    int last;
} bits_buffer;

void initbuff(bits_buffer *b);
int isEmpty(bits_buffer b);
int isFull(bits_buffer b);
void setBit(char *ch, int bitindex, int num);
int isSetBit(char ch, int bitindex);
void push(bits_buffer *b, int num);
int pop(bits_buffer *b);

#endif