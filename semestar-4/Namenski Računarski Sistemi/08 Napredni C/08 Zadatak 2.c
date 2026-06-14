/// 08 Zadatak 02
#include <stdio.h>
#include <stdlib.h>

typedef int provera(int);

int  Pozitivan(int  x) { return (x >= 0 ? 1 : 0); }
int  Negativan(int  x) { return (x <  0 ? 1 : 0); }
void IspisiNiz(int *a, int  n) { for(int i = 0; i < n; i++) printf("%d ", a[i]); printf("\n"); }

int *Izdvoj(int *buffer, provera *znakBroja)
{
    int brojac = 0;
    int niz[*buffer];

    for(int i = 0; i < *buffer; i++)
        if( (* znakBroja) ( *(buffer + i + 1)) )
        {
            niz[brojac] = *(buffer + i + 1);
            brojac++;
        }

    int *izdvojeno = (int *) malloc(brojac * sizeof(int) + 1);
    *izdvojeno = brojac;

     for(int i = 0; i < brojac; i++)
        *(izdvojeno + i + 1) = niz[i];

    return izdvojeno;
}

void Izdvajanje(int *buffer, char *string, provera *ZnakBroja)
{
    int *izdvojeno = Izdvoj(buffer, ZnakBroja);
    int * tmp      = izdvojeno;

    if(*tmp == 0)
        printf("\n[NEMA %s BROJEVA!]\n", string);
    else
    {
        printf("\nNIZ %s: ", string);
        IspisiNiz(tmp + 1, *tmp);
    }

    free(izdvojeno);
}

int main(void)
{
    int n = 0;

    while(n < 1)
    {
        printf("\nUnesite velicinu niza: ");
        scanf("%d", &n);
    }

    int *buffer = (int *) malloc(n * sizeof(int) + 1);
    *buffer = n;

    printf("\nUnos elemenata niza\n>> ");
    for(int i = 0; i < n; i++)
        scanf("%d", buffer + i + 1);
    
    Izdvajanje(buffer, "POZITIVNIH", Pozitivan);
    Izdvajanje(buffer, "NEGATIVNIH", Negativan);

    return 0;
}