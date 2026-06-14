using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z1
{
    public class Pravougaonik : GeometrijskaFigura
    {
        private double a;
        private double b;


        public virtual double A
        {
            get { return a; }
            set { a = value; }
        }

        public virtual double B
        {
            get { return b; }
            set { b = value; }
        }

        public Pravougaonik(double a = 1, double b = 1)
        {
            A = a;
            B = b;
        }


        public override double GetO()
        {
            return 2 * A + 2 * B;
        }

        public override double GetP()
        {
            return A * B;
        }


        public override string ToString()
        {
            return "Pravougaonik: a = " + A + ", b = " + B;
        }

    }
}
