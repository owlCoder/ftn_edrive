using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Z31
{
    public class Trougao : Figura
    {
        private double a, b, c;

        public double A
        {
            get { return a; }
            set { a = value; }
        }

        public double B
        {
            get { return b; }
            set { b = value; }
        }

        public double C
        {
            get { return c; }
            set { c = value; }
        }

        public Trougao(double a, double b, double c)
        {
            A = a;
            B = b;
            C = c;
        }

        public double GetO()
        {
            return A + B + C;
        }

        public double GetP()
        {
            double s = GetO() / 2;
            return Math.Sqrt(s * ((s - A) * (s - B) * (s - C)));
        }	
    }
}
