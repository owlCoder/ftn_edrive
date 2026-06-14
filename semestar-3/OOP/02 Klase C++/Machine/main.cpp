#include "machine.hpp"

int main(void)
{
    Machine m;
    int izbor;

    do
    {
        printInfo(m);
        izbor = meni();

        switch(izbor)
        {
            case 1:
                if (!m.metodaX())
                    cout << "\n------ OPERACIJA NEUSPESNA! -----\n";
                else
                    cout << "\n------------ IZVRSENO! ------------\n";
                break;
            case 2:
                if (!m.metodaY())
                    cout << "\n------ OPERACIJA NEUSPESNA! -----\n";
                else
                    cout << "\n------------ IZVRSENO! ------------\n";
                break;
            case 3:
                if (!m.metodaZ())
                    cout << "\n------ OPERACIJA NEUSPESNA! -----\n";
                else
                    cout << "\n------------ IZVRSENO! ------------\n";
                break;
            case 4:
                if (!m.metodaW())
                    cout << "\n------ OPERACIJA NEUSPESNA! -----\n";
                else
                    cout << "\n------------ IZVRSENO! ------------\n";
                break;
            case 5:
                if (!m.plus())
                    cout << "\n------ OPERACIJA NEUSPESNA! -----\n";
                else
                    cout << "\n------------ IZVRSENO! ------------\n";
                break;
            case 6:
                if (!m.minus())
                    cout << "\n------ OPERACIJA NEUSPESNA! -----\n";
                else
                    cout << "\n------------ IZVRSENO! ------------\n";
                break;
            case 7:
                break;
        }

        cout << "\n\n";

    } while (izbor != 7);

    return 0;
}
