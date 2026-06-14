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
            string danRodjenja = jmbg.Substring(0, 2);
            string mesecRodjenja = jmbg.Substring(2, 2);
            string godinaRodjenja = jmbg.Substring(4, 3);

            if (godinaRodjenja.Substring(0, 1).Equals("0"))
            {
                godinaRodjenja = "2" + godinaRodjenja;
            }
            else
            {
                godinaRodjenja = "1" + godinaRodjenja;
            }

            try
            {
                //return Convert.ToDateTime(danRodjenja + "/" + mesecRodjenja + "/" + godinaRodjenja);
                return DateTime.ParseExact(danRodjenja + "/" + mesecRodjenja + "/" + godinaRodjenja, 
                    "dd/MM/yyyy", CultureInfo.InvariantCulture);
            }
            catch (FormatException)
            {
                throw new ArgumentException("Datum je u neispravnom formatu, maticni broj nije pravilno unesen od prvog do sedmog karaktera!");
            }
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
