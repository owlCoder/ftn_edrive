using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z1
{
    public class Pravougaonik
    {
        private double a; // default 0
        private double b; 

        public Pravougaonik(double a, double b)
        {
            // this je referenca na objekat nad kojim se poziva metoda (ne postoje pokazivaci)
            this.a = a;
            this.b = b;
        }

        public Pravougaonik(Pravougaonik p)
        {
            this.a = p.a;
            this.b = p.b;
        }

        public double GetA()
        {
            return a;
        }

        public void SetA(double a)
        {
            this.a = a;
        }

        public double GetB()
        {
            return b;
        }

        public void SetB(double b)
        {
            this.b = b;
        }

        public double GetO()
        {
            return 2 * a + 2 * b;
        }

        public double GetP()
        {
            return a * b;
        }

    }
}
