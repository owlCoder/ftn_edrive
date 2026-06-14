using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fakultet
{
    class Predmet
    {
        private string ime;
        private string sifra;
        private int ocena;

        public Predmet()
        {
            ime = "/";
            sifra = "/";
            ocena = 0;
        }

        public Predmet(string ime, string sifra, int ocena)
        {
            this.ime = ime;
            this.sifra = sifra;
            this.ocena = ocena;
        }
        public override string ToString()
        {
            return "Predmet:\n\tIme: " + Ime + "\n\tSifra: " + Sifra
                + "\n\tOcena: " + Ocena;
        }

        public string Ime { get => ime; set => ime = value; }
        public string Sifra { get => sifra; set => sifra = value; }
        public int Ocena { get => ocena; set => ocena = value; }
    }
}
