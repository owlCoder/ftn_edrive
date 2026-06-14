#include <stdio.h>
#include <stdlib.h>
#include "list.h"

node *Izdvoji(char *buffer)
{
    node *studenti;
    init(&studenti);

    for(int i = 0; i < *(int *) buffer; i++)
        if( *((int *) (buffer + sizeof(int) + i * sizeof(student) + 50 * sizeof(char) )) > 5 )
        {
            student *tmp = (student *)(buffer + sizeof(int) + i * sizeof(student));
            tmp -> brojIspita = *((int  *)(buffer + sizeof(int) + i * sizeof(student) + 50 * sizeof(char)));

            addBegin(studenti, *tmp);
        }

    return studenti;
}

void IspisiStudente(node *head)
{
    node *trenutni = head -> next;

    while(trenutni != head)
    {
        printf("\nIme: %s\n",       trenutni -> data.ime);
        printf("Prezime: %s\n",     trenutni -> data.prezime);
        printf("Indeks: %s\n",      trenutni -> data.brojIndeksa);
        printf("Broj ispita: %d\n", trenutni -> data.brojIspita);

        trenutni = trenutni -> next;
    }
}

int main(void)
{
    node *head, *studenti;
    int n = 0;

    init(&head);

    do 
    {
        printf("\nUnesite broj studenata: ");
        scanf("%d", &n);
    } while(n < 1);

    char *buffer = (char *) malloc(sizeof(int) + n * sizeof(student));
    *( (int *) buffer) = n;

    for(int i = 0; i < *(int *) buffer; i++)
    {
        const int indeksUpisaUBuffer = sizeof(int) + i * sizeof(student);

        printf("\nUnesite podatke o studentu broj %d: \n", i + 1);

        printf("\tIme: ");
        scanf("%20s", (buffer + indeksUpisaUBuffer));

        printf("\tPrezime: ");
        scanf("%20s", (buffer + indeksUpisaUBuffer + 20 * sizeof(char)));

        printf("\tIndeks: ");
        scanf("%10s", (buffer + indeksUpisaUBuffer + 40 * sizeof(char)));

        printf("\tBroj ispita: ");
        scanf("%d", ( (int *) (buffer + indeksUpisaUBuffer + 50 * sizeof(char))));
    }

    studenti = Izdvoji(buffer);
    printf("\n------------------------ STUDENTI ------------------------\n");
    IspisiStudente(studenti);

    free(buffer);

    return 0;
}
