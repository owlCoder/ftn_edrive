#ifndef OLOVKA_HPP_INCLUDED
#define OLOVKA_HPP_INCLUDED

class Olovka {
    protected:
        double cena;
    public:
        Olovka() : cena(-1) { }
        Olovka(double cena) { this -> cena = cena; }
        virtual bool postaviCenu() = 0;
};

#endif // OLOVKA_HPP_INCLUDED
