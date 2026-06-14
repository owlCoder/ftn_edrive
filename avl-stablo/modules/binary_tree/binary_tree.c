#include "binary_tree.h"

void init_stablo(STABLO **koren) { *koren = NULL; }

STABLO *kreiraj_element(const int broj)
{
    STABLO *novi = malloc(sizeof(STABLO));
    if(novi == NULL)
    {
        printf("\nNema memorije za novi element!\n");
        exit(40);
    }
    novi -> broj = broj;
    novi -> dubina = 1;
    novi -> levi = NULL;
    novi -> desni = NULL;

    return novi;
}

void dodaj_u_stablo(STABLO *novi, STABLO **koren)
{
    if(*koren == NULL) {
        (*koren) = novi;
        return;
    }
    else if(novi -> broj < (*koren) -> broj) {
        dodaj_u_stablo(novi, &((*koren) -> levi));
        return;
    }
    else {
        dodaj_u_stablo(novi, &((*koren) -> desni));
        return;
    }   
}

void prikaz_podatka(STABLO *s)
{
    printf("% d   ", s -> broj);
}

void prikaz_stabla(STABLO *koren)
{
    if(koren == NULL)
        return;
    else
    {
        prikaz_stabla(koren -> levi);
        prikaz_podatka(koren);
        prikaz_stabla(koren -> desni);
    }
}

void brisanje_stabla(STABLO **koren)
{
    if(*koren == NULL)
        return;
    
    brisanje_stabla(&((*koren) -> levi));
    brisanje_stabla(&((*koren) -> desni));
    
    free((*koren));
    (*koren) = NULL;
}

int dubina_levog_podstabla(STABLO *cvor) 
{ 
    if(cvor == NULL)
        return 0;
    else
        return dubina_levog_podstabla(cvor -> levi) + 1;
} 

int dubina_desnog_podstabla(STABLO *cvor) 
{ 
    if(cvor == NULL)
        return 0;
    else
        return dubina_desnog_podstabla(cvor -> desni) + 1;
} 

void print_tree(const unsigned l, const unsigned r, const char *situation)
{
    printf("\n\n\t\t\t\t%s balansiranja stabla", situation);
    printf("\n\tDubina levog podstabla:  % d", l);
    printf("\n\tDubina desnog podstabla: % d", r);
    printf("\n\tRazlika izmedju visine levog podstabla i desnog podstabla: % d\n", l - r);
}