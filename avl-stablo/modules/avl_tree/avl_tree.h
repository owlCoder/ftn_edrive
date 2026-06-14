/***
 * 
 * CUSTOM AVL TREE IMPLEMENTATION LIBRARY
 * AUTHOR: owlCoder
 * https://github.com/owlCoder
 * (c) 2020
 * 
 ***/

#ifndef __AVL_TREE_H
#define __AVL_TREE_H

#include "../binary_tree/binary_tree.h"

STABLO *desnaRotacija(STABLO *);
STABLO *levaRotacija(STABLO *);
STABLO *AVL_dodaj_u_stablo(STABLO *, int);

int veci(const int, const int);
int dubinaStabla(const STABLO *);

int balansirano(STABLO *);

#endif