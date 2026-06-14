/// 08 Zadatak 01
#include <stdio.h>
#include <stdlib.h>

typedef int poredjenje(int, int);

int  UporediManje(int  a, int  b) { return a < b; }
int  UporediVece (int  a, int  b) { return a > b; }
void Zameni      (int *a, int *b) { int tmp = *a; *a = *b; *b = tmp; }
void IspisiNiz   (int *a, int  n) { for(int i = 0; i < n; i++) printf("%d ", a[i]); printf("\n"); }

void BubbleSort  (int  a[], int n, poredjenje *uporedi)
{
    for(int j = n - 1; j > 0; j--)
        for(int i = 0; i < j; i++)
            if( (* uporedi)(a[i + 1], a[i]) )
                Zameni(a + i + 1, a + i);
}

int main(void)
{
    int n;

    do
    {
        printf("\nUnesite dimenziju niza: ");
        scanf("%d", &n);
    } while(n < 1);

    int niz[n];

    printf("\nUnesite elemente niza\n>> ");
    for(int i = 0; i < n; i++)
        scanf("%d", niz + i);
    
    printf("\nNIZ SORTIRAN RASTUCE\n");
    BubbleSort(niz, n, UporediManje);
    IspisiNiz(niz, n);

    printf("\nNIZ SORTIRAN OPADAJUCE\n");
    BubbleSort(niz, n, UporediVece);
    IspisiNiz(niz, n);

    return 0;
}