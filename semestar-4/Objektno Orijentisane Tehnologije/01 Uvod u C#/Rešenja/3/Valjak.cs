using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z3
{
    public class Valjak
    {
        private Krug b;
        private Pravougaonik m;


        // ne mora postojati set
        public double R
        {
            get { return b.R; }
        }

        public double H
        {
            get {  return m.B; }
        }


        public Valjak(double r, double h)
        {
            this.b = new Krug(r);
            this.m = new Pravougaonik(b.GetO(), h);
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
