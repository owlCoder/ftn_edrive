using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Z3;

namespace Z31
{
    public class PP3Prizma
    {
        private JSTrougao b;
        private Pravougaonik m; // mozemo koristiti iz prethodnog zadatka (reference + using)

        public PP3Prizma(double a, double h)
        {
            this.b = new JSTrougao(a);
            this.m = new Pravougaonik(b.GetO(), h);
        }

        public double A
        {
            get { return b.A; }
        }

        public double H
        {
            get { return m.B; }
        }

        public double GetP()
        {
            return 2 * b.GetP() + m.GetP();
        }

        public double GetV()
        {
            return b.GetP() * H;
        }

    }
}
