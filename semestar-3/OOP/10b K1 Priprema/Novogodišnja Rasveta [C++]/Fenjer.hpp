#ifndef FENJER_HPP_INCLUDED
#define FENJER_HPP_INCLUDED

enum Materijal {STIROPOR, PLASTIKA, METAL};

class Fenjer {
    protected:
        Materijal materijal;
        bool ispravan;
    public:
        Fenjer() : materijal(STIROPOR), ispravan(false) { }
        Fenjer(const Materijal materijal, const bool ispravan) : materijal(materijal), ispravan(ispravan) { }

        Materijal getMaterijal() const { return materijal; }
        bool getIspravan() const { return ispravan; }

        void setMaterijal(const Materijal materijal) { this -> materijal = materijal; }
        void setIspravan(const bool ispravan) { this -> ispravan = ispravan; }

        virtual bool popravi() = 0;

        void ispis() const {
            string mat;

            if(materijal == STIROPOR)
                mat = "STIROPOR";
            else if(materijal == PLASTIKA)
                mat = "PLASTIKA";
            else if(materijal == METAL)
                mat = "METAL";
            else
                mat = "NEPOZNAT";

            cout << "\tMaterijal: " << mat << endl;
            cout << "\tIspravan:  " << (ispravan == true ? "ISPRAVAN" : "NIJE ISPRAVAN") << endl;
        }
};

#endif // FENJER_HPP_INCLUDED
