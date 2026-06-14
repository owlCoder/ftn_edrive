/// 07 Primer 1
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int IzracunajDeterminantu(int *buffer)
{
    int n = buffer[0];

    if(n == 1)
        return buffer[1];
    else if(n == 2)
        return buffer[1] * buffer[4] - buffer[2] * buffer[3];
    else
    {
        int kolona, suma = 0;
        int A[n][n];

        for(int j = 0; j < n; j++)
            for(int i = 0; i < n; i++)
                A[j][i] = buffer[j * n + i + 1];
        
        int drugiBuffer[ (n - 1) * (n - 1) + 1];
        drugiBuffer[0] = n - 1;

        for(kolona = 0; kolona < n; kolona++)
        {
            /// RAZVOJ PO NULTOJ VRSTI - TA VRSTA SE PRESKACE
            for(int j = 1; j < n; j++)
                for(int i = 0; i < n; i++)
                    if(i < kolona)
                        drugiBuffer[ (j - 1) * (n - 1) + i + 1] = A[j][i];
                    else if(i > kolona)
                        drugiBuffer[ (j - 1) * (n - 1) + (i - 1) + 1] = A[j][i];
            
            suma += pow(-1, kolona) * A[0][kolona] * IzracunajDeterminantu(drugiBuffer);
        }

        return suma;
    }
}

int main(void)
{
    int n;

    do
    {
        printf("\nUnesite dimenziju matrice: ");
        scanf("%d", &n);
    } while(n < 1);

    int A[n][n];

    printf("\nUNOS ELEMENATA MATRICE\n");
    for(int j = 0; j < n; j++)
        for(int i = 0; i < n; i++)
        {
            printf("\tA[%d][%d] = ", j, i);
            scanf("%d", &A[j][i]);
        }
    
    int buffer[n * n + 1];
    buffer[0] = n;

    for(int j = 0; j < n; j++)
        for(int i = 0; i < n; i++)
            buffer[j * n + i + 1] = A[j][i];

    printf("\n\nDETERMINANTA MATRICE JE: %d\n", IzracunajDeterminantu(buffer));

    return 0;
}