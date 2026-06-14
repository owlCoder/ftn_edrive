using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PojavaBroja
{
    class PojavaBroja
    {
        private int broj;
        private int noEl;

        public PojavaBroja()
        {
            this.Broj = 0;
            this.NoEl = 0;
        }

        public PojavaBroja(int broj, int noEl)
        {
            this.Broj = broj;
            this.NoEl = noEl;
        }
        public int Broj { get => broj; set => broj = value; }
        public int NoEl { get => noEl; set => noEl = value; }

        public override bool Equals(object obj)
        {
            return obj is PojavaBroja broja &&
                   Broj == broja.Broj &&
                   NoEl == broja.NoEl;
        }
        public override string ToString()
        {
            return broj + ", " + noEl + "\n";
        }
    }
}
