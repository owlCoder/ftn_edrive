#ifndef LIST_H_INCLUDED
#define LIST_H_INCLUDED

#include <stdio.h>
#include <stdlib.h>

// kruzna lista sa granicnikom

typedef struct Node
{
    int data;
    struct Node *next;
} node;


void init(node **l);
void addBegin(node *l, int s);
void addEnd(node **l, int s);

#endif
