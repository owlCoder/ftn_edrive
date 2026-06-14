using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restoran
{
    class Stavka
    {
        private string naziv;
        private double cena;

        public Stavka(string naziv, double cena)
        {
            this.Naziv = naziv;
            this.Cena = cena;
        }

        public string Naziv { get => naziv; set => naziv = value; }
        public double Cena { get => cena; set => cena = value; }

        public override string ToString()
        {
            return "Stavka[" + naziv + "] = " + cena + " DIN";
        }
    }
}
