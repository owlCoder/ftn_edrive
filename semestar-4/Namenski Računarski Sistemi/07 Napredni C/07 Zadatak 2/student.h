#ifndef STUDENT_H_INCLUDED
#define STUDENT_H_INCLUDED

#include "ispiti.h"

typedef struct {
    char ime[20];
    char prezime[20];
    char brIndeksa[10];
    int brIspita;
    ispit ispiti[10]; // pamti se poslednjih 10 ispita
} student;

#endif
