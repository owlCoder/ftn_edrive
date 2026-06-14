#include "Pravougaonik.hpp"

Pravougaonik::Pravougaonik()
{
    a = 1;
    b = 1;
}

Pravougaonik::Pravougaonik(double a, double b)
{
    this -> a = a;
    this -> b = b;
}

Pravougaonik::Pravougaonik(const Pravougaonik& p)
{
    a = p.a;
    b = p.b;
}

double Pravougaonik::getA() const
{
    return a;
}

double Pravougaonik::getB() const
{
    return b;
}

void Pravougaonik::setA(const double a)
{
    this -> a = a;
}

void Pravougaonik::setB(const double b)
{
    this -> b = b;
}

double Pravougaonik::getP() const
{
    return a * b;
}

double Pravougaonik::getO() const
{
    return 2 * (a + b);
}
