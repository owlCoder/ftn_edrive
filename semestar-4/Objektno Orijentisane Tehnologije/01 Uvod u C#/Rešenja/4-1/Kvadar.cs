using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Z1;

namespace Z11
{
    public class Kvadar : GeometrijskoTelo
    {

        protected Pravougaonik b;
        protected Pravougaonik m;

        public Kvadar(double a, double b, double h)
        {
            this.b = new Pravougaonik(a, b);
            this.m = new Pravougaonik(2 * a + 2 * b, h);
        }

        public double A
        {
            get
            {
                return b.A;
            }
        }

        public double B
        {
            get
            {
                return b.B;
            }
        }

        public double H
        {
            get
            {
                return m.B;
            }
        }

        public override double GetP()
        {
            return 2 * b.GetP() + m.GetP();
        }

        public override double GetV()
        {
            return b.GetP() * H;
        }


    }
}
