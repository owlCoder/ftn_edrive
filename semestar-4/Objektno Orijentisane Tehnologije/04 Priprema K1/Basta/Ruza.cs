using System;

namespace Basta
{
    [Serializable]
    class Ruza : Biljka
    {
        private string naziv;
        private string vrsta;
        private int starost;
        private bool zalivena;

        public Ruza()
        {
            Naziv = "/";
            Vrsta = "/";
            Starost = 0;
            Zalivena = false;
        }
        public Ruza(string naziv, string vrsta, int starost, bool zalivena)
        {
            Naziv = naziv;
            Vrsta = vrsta;
            Starost = starost;
            Zalivena = zalivena;
        }

        public bool Zalivanje()
        {
            if (Zalivena)
                return false;
            else
            {
                Zalivena = true;
                return true;
            }
        }

        public string Naziv { get => naziv; set => naziv = value; }
        public string Vrsta { get => vrsta; set => vrsta = value; }
        public int Starost { get => starost; set => starost = value; }
        public bool Zalivena { get => zalivena; set => zalivena = value; }

        public override string ToString()
        {
            return "------------------- RUZA -------------------\n\tNaziv: " + Naziv + "\n\tVrsta: " + Vrsta + "\n\tStarost: " + Starost + " meseci\n\t" +
                        "Zalivena: " + (Zalivena == true ? "DA" : "NE") + "\n";
        }
    }
}
