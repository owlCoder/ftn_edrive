#include "Pravougaonik.hpp"

int main(void)
{
    Pravougaonik p1;
    Pravougaonik p2(5.2, 3.0);
    Pravougaonik p3(p1);

    cout << "P1\n\ta = " << p1.getA() << ", b = " << p1.getB()
         << "\n\tP = " << p1.getP() << ", O = " << p1.getO() << endl << endl;

    p1.setA(10.3);
    cout << "p1.setA(10.3)\n\ta = " << p1.getA() << ", b = " << p1.getB()
         << "\n\tP = " << p1.getP() << ", O = " << p1.getO() << endl << endl;

    cout << "P2\n\ta = " << p2.getA() << ", b = " << p2.getB()
         << "\n\tP = " << p2.getP() << ", O = " << p2.getO() << endl << endl;

    cout << "P3\n\ta = " << p3.getA() << ", b = " << p3.getB()
         << "\n\tP = " << p3.getP() << ", O = " << p3.getO() << endl << endl;

    return 0;
}
