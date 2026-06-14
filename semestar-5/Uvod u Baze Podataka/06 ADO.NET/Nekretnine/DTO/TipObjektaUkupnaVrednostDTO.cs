using Nekretnine.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nekretnine.DTO
{
    public class TipObjektaUkupnaVrednostDTO
    {
        public List<Objekat> Objekti { get; set; } // lista objekata po zad. krit.
        public double UkupnaVrednost { get; set; } // njihova ukupna vrednost

        // potreban nam je samo jos konstruktor kako bi UkupnuVrednost postavili na 0
        public TipObjektaUkupnaVrednostDTO()
        {
            Objekti = new List<Objekat>(); // inicijalizujemo praznu listu objekata
            UkupnaVrednost = 0.0; // pocetna vrednost je 0
        }
    }
}
