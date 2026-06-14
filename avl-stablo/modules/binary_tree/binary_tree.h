/***
 * 
 * CUSTOM BINARY TREE IMPLEMENTATION LIBRARY
 * AUTHOR: owlCoder
 * https://github.com/owlCoder
 * (c) 2020
 * 
 * IMPORTANT NOTE: CREATING BINARY TREE USING THIS LIBRARY MAY RESULT
 * UNBALANCED BINARY TREE
 * FOR BALANCED TREE USE ~ CUSTOM AVL TREE IMPLEMENTATION LIBRARY ~
 ***/
 
#ifndef __BINARY_TREE_H
#define __BINARY_TREE_H

#include <stdio.h>
#include <stdlib.h>

typedef struct stablo_st
{
    int broj;
    int dubina;
    struct stablo_st *levi;
    struct stablo_st *desni;
} STABLO;
    
void init_stablo(STABLO **);
STABLO *kreiraj_element(const int);
void dodaj_u_stablo(STABLO *, STABLO **);
void prikaz_podatka(STABLO *);
void prikaz_stabla(STABLO *);
void brisanje_stabla(STABLO **);

int dubina_levog_podstabla(STABLO *);
int dubina_desnog_podstabla(STABLO *);

void print_tree(const unsigned, const unsigned, const char *);

#endif
