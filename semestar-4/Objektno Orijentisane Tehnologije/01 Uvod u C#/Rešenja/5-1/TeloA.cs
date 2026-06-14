using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Z31
{
    public class TeloA
    {
        private Pravougaonik p1, p2, p3;
        private Trougao t;

        public TeloA(double a, double b, double c, double d, double h)
        {
            p1 = new Pravougaonik(a, d);
            p2 = new Pravougaonik(p1.GetO(), h);
            p3 = new Pravougaonik(c + b, d);
            t = new Trougao(a, b, c);
        }

        public double GetP()
        {
            return p1.GetP() + p2.GetP() + p3.GetP() + 2 * t.GetP();
        }

        public double GetV()
        {
            return p1.GetP() * p2.B + p3.GetP() * p1.B;
        }

        public override string ToString()
        {
            return "TeloA: P = " + GetP() + ", V = " + GetV();
        }
    }
}
