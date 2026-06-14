using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z3
{
    public class Kvadrat : Pravougaonik
    {
        public override double A
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
