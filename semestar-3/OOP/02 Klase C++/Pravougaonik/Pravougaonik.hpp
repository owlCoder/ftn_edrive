#ifndef PRAVOUGAONIK_HPP
#define PRAVOUGAONIK_HPP

#include <iostream>
using namespace std;

class Pravougaonik
{
    private:
        double a, b;
    public:
        Pravougaonik();
        Pravougaonik(double, double);
        Pravougaonik(const Pravougaonik&);

        double getA() const;
        double getB() const;

        void setA(const double);
        void setB(const double);

        double getP() const;
        double getO() const;
};

#endif // PRAVOUGAONIK_HPP
