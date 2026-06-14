using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace K1
{
    [Serializable]
    class Artikal
    {
        private string sifra;
        private string naziv;
        private string opis;
        private int cena;

        public Artikal()
        {
            sifra = "/";
            naziv = "/";
            opis = "/";
            cena = 0;
        }

        public Artikal(string sifra, string naziv, string opis, int cena)
        {
            this.sifra = sifra;
            this.naziv = naziv;
            this.opis = opis;
            this.cena = cena;
        }

        public string Sifra { get => sifra; set => sifra = value; }
        public string Naziv { get => naziv; set => naziv = value; }
        public string Opis { get => opis; set => opis = value; }
        public int Cena { get => cena; set => cena = value; }

        public override string ToString()
        {
            return "Artikal\n\tSifra: " + Sifra + "\n\tNaziv: " + Naziv
                + "\n\tOpis: " + Opis + "\n\tCena: " + Cena;
        }
    }
}
