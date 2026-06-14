using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common;

namespace Osoba
{
    public class Osoba : IOsoba
    {
        public string JMBG { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public DateTime DatumRodjenja { get; set; }
        public Pol PolOsobe { get; set; }

        public Osoba()
        {
            // Prazan konstruktor
        }

        public Osoba(string jmbg, string ime, string prezime)
        {
            if(ProveraJMBG(jmbg) && ProveraIme(ime) && ProveraPrezime(prezime))
            {
                Ime = ime;
                Prezime = prezime;
                JMBG = jmbg;
                DatumRodjenja = OdredjivanjeDatumRodjenja(jmbg);
                PolOsobe = OdrediPol(jmbg);
            }
        }

        public bool ProveraJMBG(string jmbg)
        {
            if(jmbg == null)
            {
                throw new ArgumentNullException("JMBG ne sme biti null!");
            }

            if(jmbg.Trim().Equals(""))
            {
                throw new ArgumentException("Jmbg mora da sadrzi karaktere!");
            }

            if (jmbg.Trim().Length != 13)
            {
                return false;
            }
            else
            {
                return long.TryParse(jmbg, out long s);
            }
        }

        public bool ProveraIme(string ime)
        {
            if (ime == null)
            {
                throw new ArgumentNullException("Ime ne sme biti null!");
            }

            if (ime.Trim().Equals(""))
            {
                throw new ArgumentException("Ime mora da sadrzi karaktere!");
            }

            return true;
        }

        public bool ProveraPrezime(string prezime)
        {
            if (prezime == null)
            {
                throw new ArgumentNullException("Prezime ne sme biti null!");
            }

            if (prezime.Trim().Equals(""))
            {
                throw new ArgumentException("Prezime mora da sadrzi karaktere!");
            }

            return true;
        }

        Pol OdrediPol(string jmbg)
        {
            if(int.Parse(jmbg.Substring(9, 3)) < 500)
            {
                return Pol.MUSKI;
            }    
            else
            {
                return Pol.ZENSKI;
            }
        }

        DateTime OdredjivanjeDatumRodjenja(string jmbg)
        {
            string danRodjenja = jmbg.Substring(0, 2);
            string mesecRodjenja = jmbg.Substring(2, 2);
            string godinaRodjenja = jmbg.Substring(4, 3);

            if(godinaRodjenja.Substring(0, 1).Equals("0"))
            {
                godinaRodjenja = "2" + godinaRodjenja;
            }
            else
            {
                godinaRodjenja = "1" + godinaRodjenja;
            }

            try
            {
                return DateTime.ParseExact(danRodjenja + "/" + mesecRodjenja + "/" + godinaRodjenja,
                                           "dd/MM/yyyy", CultureInfo.InvariantCulture);
            }
            catch(FormatException)
            {
                throw new ArgumentException("Datum je u neispravnom formatu!");
            }
        }
    }
}
