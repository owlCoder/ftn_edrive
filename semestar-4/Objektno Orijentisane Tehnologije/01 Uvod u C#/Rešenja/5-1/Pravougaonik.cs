using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Z31
{
    public class Pravougaonik : Figura
    {
        private double a;
        private double b;

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
        
        public Pravougaonik(double a, double b)
        {
            A = a;
            B = b;
        }

        public double GetO()
        {
            return 2 * A + 2 * B;
        }

        public double GetP()
        {
            return A * B;
        }
    }
}
