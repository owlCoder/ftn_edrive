#include "xnay.hpp"

XnaY::XnaY()
{
    x = 1;
    y = 1;
}

XnaY::XnaY(int x, int y)
{
    this -> x = x;
    this -> y = y;
}

XnaY::XnaY(const XnaY& xy)
{
    x = xy.x;
    y = xy.y;
}

double XnaY::getXnaY() const
{
    return pow(x, y);
}

ostream& operator<<(ostream& out, const XnaY & xy)
{
    out << "\tx = " << xy.getX() << ", y = " << xy.getY()
        << "\n\tx^y = " << xy.getXnaY() << endl;

    return out;
}
