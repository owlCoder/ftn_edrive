using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Common;

namespace Banka
{
    public class Racun : IRacun
    {
        public IOsoba Vlasnik { get; set; }

        public string BrojRacuna { get; set; }

        public Decimal Stanje { get; set; }

        public Decimal DozvoljeniMinus { get; set; }

        public Racun(IOsoba vlasnik, string brojRacuna, Decimal dozvoljeniMinus)
        {
            if (vlasnik == null || brojRacuna == null)
            {
                throw new ArgumentNullException("Argumenti ne smeju da budu null");
            }

            if (dozvoljeniMinus <= 0)
            {
                throw new ArgumentException("Dozvoljeni minus mora biti veci od 0");
            }

            ProveriBrojRacuna(vlasnik, brojRacuna);

            Vlasnik = vlasnik;
            BrojRacuna = brojRacuna;
            Stanje = 0;
            DozvoljeniMinus = dozvoljeniMinus;

        }

        void ProveriBrojRacuna(IOsoba vlasnik, string brojRacuna)
        {
            Regex reg = new Regex(@"^\d{19}$");

            if (!reg.IsMatch(brojRacuna))
            {
                throw new ArgumentException("Broj racuna mora imati 19 cifara");
            }

            if (brojRacuna.Substring(3, 13) != vlasnik.Jmbg)
            {
                throw new ArgumentException("Deo racuna mora da se poklapa sa JMBG-om");
            }

            if (brojRacuna.Substring(0, 1) == "0" ||
                brojRacuna.Substring(1, 1) == "0" ||
                brojRacuna.Substring(2, 1) == "0")
            {
                throw new ArgumentException("Prve tri cifre ne smeju biti 0");
            }

        }
    }
}
