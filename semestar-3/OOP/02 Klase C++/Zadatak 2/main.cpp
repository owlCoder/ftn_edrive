#include "Rerna.hpp"

int main()
{
    Rerna r1;
    int izbor = -1;

    do
    {
        int izbor = meni();
        cout << endl;

        switch(izbor)
        {
            case 1:
                if(r1.ukljuci())
                    cout << "\nRERNA UKLJUCENA!\n";
                else
                    cout << "\nGRESKA PRI UKLJUCENJU!\n";
                break;
            case 2:
                if(r1.iskljuci())
                    cout << "\nRERNA ISKLJUCENA!\n";
                else
                    cout << "\nGRESKA PRI ISKLJUCENJU!\n";
                break;
            case 3:
                if(r1.pokvari())
                    cout << "\nRERNA POKVARENA!\n";
                else
                    cout << "\nGRESKA PRI KVARENJU!\n";
                break;
            case 4:
                if(r1.popravi())
                    cout << "\nRERNA POPRAVLJENA!\n";
                else
                    cout << "\nGRESKA PRI POPRAVCI!\n";
                break;
            case 5:
                if(r1.pojacajTemperaturu())
                    cout << "\nRERNA TEMP UP!\n";
                else
                    cout << "\nGRESKA PRI INKREMENTACIJI TEMPERATURE!\n";
                break;
            case 6:
                if(r1.smanjiTemperaturu())
                    cout << "\nRERNA TEMP DOWN!\n";
                else
                    cout << "\nGRESKA PRI SMANJENU TEMPERATURE!\n";
                break;
            case 7:
                ispisiRernu(r1);
                break;
            case 8:
                return 0;
                break;
            default:
                cout << "\nNEPOZNATO!\n";
        }
        cout << endl;
    } while(izbor != 8);

    return 0;
}
