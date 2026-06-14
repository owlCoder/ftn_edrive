#ifndef MACHINE_HPP
#define MACHINE_HPP

#include <iostream>
using namespace std;

enum MachineState {sA, sB, sC, sD};

class Machine
{
    private:
        MachineState currentState;
        int value;

    public:
        Machine();
        Machine(MachineState, int);
        Machine(const Machine &);

        string getCurrentState() const;
        unsigned int getValue() const { return value; }

        void setCurrentState(const MachineState currentState) { this -> currentState = currentState; }
        void setValue(const int value) { this -> value = value; }

        bool metodaX();
        bool metodaY();
        bool metodaZ();
        bool metodaW();

        bool plus();
        bool minus();
};

// SLOBODNE FUNKCIJE
void printInfo(const Machine &);
int meni();

#endif // MACHINE_HPP
