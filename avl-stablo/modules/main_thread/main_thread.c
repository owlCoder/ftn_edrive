#include "main_thread.h"

void main_thread__stdin_check(const unsigned argc)
{
    if(argc < 2)
    {
        printf("\nUSAGE: balansirano_binarno_stablo num1 ...\n");
        exit(42);
    }
}

void main_thread__data_load(const unsigned argc, char **argn, STABLO **koren, STABLO **avl_koren)
{
    init_stablo(koren);
    init_stablo(avl_koren);

    unsigned brarg = argc - 1, i = 1;
    while(i <= brarg) {
        *avl_koren = AVL_dodaj_u_stablo(*avl_koren, atoi(argn[i]));
        dodaj_u_stablo(kreiraj_element(atoi(argn[i])), koren);
        i++;
    }

}

void main_thread__stdout_print(STABLO *koren, STABLO *avl_koren)
{
    printf("\n %s balansiranja stabla\n ", "Pre"); 
    prikaz_stabla(koren); 
    print_tree(dubina_levog_podstabla(koren), dubina_desnog_podstabla(koren), "Pre");
    printf("\n\n");

    printf("\n %s balansiranja stabla\n ", "Posle"); 
    prikaz_stabla(avl_koren); 
    printf("\n\n");

    print_tree(dubina_levog_podstabla(avl_koren), dubina_desnog_podstabla(avl_koren), "Posle");
}

void main_thread__clean_up(STABLO **koren, STABLO **avl_koren)
{
    brisanje_stabla(koren);
    brisanje_stabla(avl_koren);
}
