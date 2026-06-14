using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common;

namespace Osoba
{
    public class Osoba : IOsoba
    {
        public string Jmbg { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public DateTime DatumRodjenja { get; set; }
        public Pol PolOsobe { get; set; }

        public Osoba() { }

        public Osoba(string jmbg, string ime, string prezime)
        {
            if (ime == null || prezime == null || jmbg == null)
            {
                throw new ArgumentNullException("Argumenti ne smeju biti null");
            }

            if (ime.Trim() == "")
            {
                throw new ArgumentException("Ime mora da sadrzi karaktere");
            }

            if (prezime.Trim() == "")
            {
                throw new ArgumentException("Prezime mora da sadrzi karaktere");
            }

            if (jmbg.Trim() == "")
            {
                throw new ArgumentException("Jmbg mora da sadrzi karaktere");
            }

            if (!CheckJmbg(jmbg))
            {
                throw new ArgumentException("JMBG mora da sadrzi 13 brojeva");
            }

            Ime = ime;
            Prezime = prezime;
            Jmbg = jmbg;
            DatumRodjenja = OdrediDatumRodjenja(jmbg);
            PolOsobe = OdrediPol(jmbg);
        }
        Pol OdrediPol(string jmbg)
        {
            if (int.Parse(jmbg.Substring(9, 3)) < 500)
                return Pol.Muski;
            else
                return Pol.Zenski;
        }
        DateTime OdrediDatumRodjenja(string jmbg)
        {
            return new DateTime();
        }       

        public bool CheckJmbg(string jmbg)
        {
            if (jmbg.Length != 13)
            {
                return false;
            }
            else
            {
                return long.TryParse(jmbg, out long s);            
            }
        }
    }
}
