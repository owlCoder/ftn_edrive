#ifndef LIST_H_INCLUDED
#define LIST_H_INCLUDED
#include "student.h"

// kruzna lista sa granicnikom

typedef struct node {
    student data;
    struct node *next;
} node;

void init(node **l);
void addBegin(node *l, student s);
void addLast(node **l, student s);

#endif
