#include "Monitor.hpp"

void printInfo(const Monitor &m) {
    cout << "MONITOR: " << endl;
    cout << "\nMonitor state: ";

    switch(m.getMonitorState()) {
        case sOUT:     cout << "sOUT";     break;
        case sON:      cout << "sON";      break;
        case sOFF:     cout << "sOFF";     break;
        case sTEST:    cout << "sTEST";    break;
        case sSTANDBY: cout << "sSTANDBY"; break;
        default:       cout << "NEPOZNATO!";
    }
    cout << endl << "\tBrightness: " << m.getBrightness();
    cout << endl << "\tScreen state: " << (m.getScreenState() == ssON ? "ON" : "OFF");
}

int main(void)
{
    Monitor m;

    printInfo(m);
    cout << (m.turnOn() ? "\n\nUSPESNO" : "\n\nNEUSPESNO");
    cout << (m.turnOn() ? "\nUSPESNO" : "\nNEUSPESNO");
    cout << (m.turnOff() ? "\nUSPESNO" : "\nNEUSPESNO");
    cout << (m.turnTest() ? "\nUSPESNO" : "\nNEUSPESNO");
    cout << (m.turnStandBy() ? "\nUSPESNO" : "\nNEUSPESNO");
    cout << (m.repair() ? "\nUSPESNO" : "\nNEUSPESNO");
    cout << (m.turnOn() ? "\nUSPESNO" : "\nNEUSPESNO");
    cout << (m.incB() ? "\nUSPESNO" : "\nNEUSPESNO");
    cout << (m.incB() ? "\nUSPESNO" : "\nNEUSPESNO") << endl;
    printInfo(m);

    return 0;
}
