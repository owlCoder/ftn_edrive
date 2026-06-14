#ifndef __MAIN_THREAD_H
#define __MAIN_THREAD_H

#include "../avl_tree/avl_tree.h"

void main_thread__stdin_check(const unsigned);
void main_thread__data_load(const unsigned, char **,  STABLO **,  STABLO **);
void main_thread__stdout_print(STABLO *, STABLO *);
void main_thread__clean_up(STABLO **, STABLO **);

#endif