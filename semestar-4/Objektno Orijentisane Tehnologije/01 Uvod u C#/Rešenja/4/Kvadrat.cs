using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z1
{
    public class Kvadrat : Pravougaonik
    {
        // virtual - override (polimorfizam)
        public new double A
        {
            get { return base.A; }
            set {
                base.A = value;
                base.B = value;
            }
        }


        public override double B
        {
            get { return base.B; }
            set
            {
                base.A = value;
                base.B = value;
            }
        }

        public Kvadrat(double a)
        {
            A = a;
        }

        public override String ToString()
        {
            return "Kvadrat: a = " + A;
        }

    }
}
