using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z3
{
    public class Pravougaonik
    {
        private double a;
        private double b;


        // properties
        // umesto get i set metoda
        public double A
        {
            get { return a; }
            set { a = value; }  // value - rezervisana rec za prenos vrednosti za setovanje polja
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
