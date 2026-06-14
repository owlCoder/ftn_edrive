using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z3
{
    // Klasa Pravougaonik implementira interfejs IGeometrijskaFigura
    public class Pravougaonik : IGeometrijskaFigura
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

        //ne treba override jer je GeometrijskaFigura interfejs
        //metoda se ne redefinise, vec se implementira
        public double GetO()
        {
            return 2 * A + 2 * B;
        }

        public double GetP()
        {
            return A * B;
        }


        public override string ToString()
        {
            return "Pravougaonik: a = " + A + ", b = " + B;
        }

    }
}
