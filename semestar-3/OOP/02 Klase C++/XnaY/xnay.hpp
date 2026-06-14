#ifndef XNAY_HPP
#define XNAY_HPP

#include <iostream>
#include <cmath>

using namespace std;

class XnaY
{
    private:
        int x, y;

    public:
        XnaY();
        XnaY(int, int);
        XnaY(const XnaY &);

        int getX() const { return x; }
        int getY() const { return y; }

        void setX(int x) { this -> x = x; }
        void setY(int y) { this -> y = y; }
        void setX_Y(int x, int y) { this -> x = x; this -> y = y; }

        double getXnaY() const;
        friend ostream& operator<<(ostream &, const XnaY &);
};

#endif // XNAY_HPP
