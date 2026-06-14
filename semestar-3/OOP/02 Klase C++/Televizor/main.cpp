#include "televizor.hpp"

int main(void)
{
    Televizor t;
    int izbor;

    do
    {
        ispis(t);
        izbor = meni();

        switch(izbor)
        {
            case 1:
                if (!t.ukljuci())
                    cout << "\n------ OPERACIJA NEUSPESNA! -----\n";
                else
                    cout << "\n------------ IZVRSENO! ------------\n";
                break;
            case 2:
                if (!t.iskljuci())
                    cout << "\n------ OPERACIJA NEUSPESNA! -----\n";
                else
                    cout << "\n------------ IZVRSENO! ------------\n";
                break;
            case 3:
                if (!t.pokvari())
                    cout << "\n------ OPERACIJA NEUSPESNA! -----\n";
                else
                    cout << "\n------------ IZVRSENO! ------------\n";
                break;
            case 4:
                if (!t.popravi())
                    cout << "\n------ OPERACIJA NEUSPESNA! -----\n";
                else
                    cout << "\n------------ IZVRSENO! ------------\n";
                break;
            case 5:
                if (!t.pojacajZvuk())
                    cout << "\n------ OPERACIJA NEUSPESNA! -----\n";
                else
                    cout << "\n------------ IZVRSENO! ------------\n";
                break;
            case 6:
                if (!t.smanjiZvuk())
                    cout << "\n------ OPERACIJA NEUSPESNA! -----\n";
                else
                    cout << "\n------------ IZVRSENO! ------------\n";
                break;
            case 7:
                if (!t.sledeciKanal())
                    cout << "\n------ OPERACIJA NEUSPESNA! -----\n";
                else
                    cout << "\n------------ IZVRSENO! ------------\n";
                break;
            case 8:
                if (!t.prethodniKanal())
                    cout << "\n------ OPERACIJA NEUSPESNA! -----\n";
                else
                    cout << "\n------------ IZVRSENO! ------------\n";
                break;
            case 9:
                break;
        }

        cout << "\n\n";

    } while (izbor != 9);

    return 0;
}
