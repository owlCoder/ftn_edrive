#include "izraz.h"
#include "list.h"
#pragma pack(4)

void CopyLEToBE(int x, void *copy)
{
    for(int i = 0; i < sizeof(x); i++)
        *((char *) copy + i) = *((char *) &x + sizeof(x) - i - 1);
}

void Izracunaj(char *buffer)
{
    for(int i = 0; i < *((int *) buffer); i++)
    {
        izraz tmp;

        tmp.broj1     = *((short *) (buffer + sizeof(int) + i * sizeof(izraz)));
        tmp.operacija = *(buffer + sizeof(int) + i * sizeof(izraz) + 2);
        tmp.broj2     = *((short *) (buffer + sizeof(int) + i * sizeof(izraz) + 4) );
        tmp.rezultat  = 0;

        if(tmp.operacija == '+')
            tmp.rezultat = tmp.broj1 + tmp.broj2;
        else if(tmp.operacija == '-')
            tmp.rezultat = tmp.broj1 - tmp.broj2;
        else if(tmp.operacija == '*')
            tmp.rezultat = tmp.broj1 * tmp.broj2;
        else if(tmp.operacija == '/')
            tmp.rezultat = tmp.broj1 / tmp.broj2;

        *((int *) (buffer + sizeof(int) + i * sizeof(izraz) + 8)) = tmp.rezultat;
    }
}

node *Izdvoj(char *buffer)
{
    int n = *((int *) buffer);
    int rezultat, rezultatBigEndian;
    node *head;

    init(&head);

    for(int i = 0; i < *((int *) buffer); i++)
    {
        rezultat = *((int *)(buffer + sizeof(int) + i * sizeof(izraz) + 8));
        CopyLEToBE(rezultat, &rezultatBigEndian);
        addEnd(&head, rezultatBigEndian);
    }

    return head;
}

int main(void)
{
    int rezultat, rezultatBigEndian;
    char *buffer = NapraviNiz();

    IspisiNiz(buffer);
    Izracunaj(buffer);
    IspisiNiz(buffer);

    node *head = Izdvoj(buffer);
    node *temp = head -> next;

    printf("Rezultati izraza su: ");
    while(temp != head)
    {
        rezultatBigEndian = temp -> data;
        CopyLEToBE(rezultatBigEndian, &rezultat);
        temp = temp -> next;

        printf("%d ", rezultat);
    }

    printf("\n");

    return 0;
}