#include "machine.hpp"

Machine::Machine()
{
    currentState = sC;
    value = 80;
}


Machine::Machine(MachineState currentState, int value)
{
    this -> currentState = currentState;
    this -> value = value;
}

Machine::Machine(const Machine& m)
{
    currentState = m.currentState;
    value = m.value;
}

bool Machine::metodaX()
{
    bool uspesno = false;

    if(currentState == sB || currentState == sC)
    {
        currentState = sA;
        uspesno = true;
    }
    return uspesno;
}

bool Machine::metodaY()
{
    bool uspesno = false;

    if(currentState == sB || currentState == sD)
    {
        currentState = sC;
        value = 80;
        uspesno = true;
    }
    return uspesno;
}

bool Machine::metodaZ()
{
    bool uspesno = false;

    if(currentState == sA)
    {
        currentState = sB;
        value = 0;
        uspesno = true;
    }
    return uspesno;
}

bool Machine::metodaW()
{
    bool uspesno = false;

    if(currentState == sA)
    {
        currentState = sD;
        value = 0;
        uspesno = true;
    }
    return uspesno;
}

string Machine::getCurrentState() const
{
    if(currentState == sA)
        return "sA";
    else if(currentState == sB)
        return "sB";
    else if(currentState == sC)
        return "sC";
    else if(currentState == sD)
        return "sD";
    else
        return "sNone";
}

bool Machine::plus()
{
    bool uspesno = false;
    if(currentState == sA && value + 20 <= 80)
    {
        value += 20;
        uspesno = true;
    }
    return uspesno;
}

bool Machine::minus()
{
    bool uspesno = false;
    if(currentState == sA && value - 20 >= 0)
    {
        value -= 20;
        uspesno = true;
    }
    return uspesno;
}

// SLOBODNE FUNKCIJE
void printInfo(const Machine &m)
{
    cout << "Stanje: " << m.getCurrentState() << endl;
    cout << "Vrednost: " << m.getValue() << endl;
}

int meni()
{   int n;

    cout << endl << " ----------- MACHINE ------------" << endl;
    cout << " | \t1 - metodaX()\t\t|" << endl;
    cout << " | \t2 - metodaY()\t\t|" << endl;
    cout << " | \t3 - metodaZ()\t\t|" << endl;
    cout << " | \t4 - metodaW()\t\t|" << endl;
    cout << " | \t5 - plus()\t\t|" << endl;
    cout << " | \t6 - minus()\t\t|" << endl;
    cout << " | \t7 - Kraj\t\t|" << endl;
    cout << " --------------------------------" << endl;

    do
    {
        cout << ">> ";
        cin >> n;
    } while(n < 1 || n > 7);

    return n;
}
