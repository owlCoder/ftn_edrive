using System;

namespace Common
{
    public class Lice
    {
        public long Jmbg { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }

        public Lice(long jmbg = 1, string ime = "Ime", string prezime = "Prezime")
        {
            if (ime == null)
                throw new ArgumentNullException(nameof(ime));

            if (prezime == null)
                throw new ArgumentNullException(nameof(prezime));

            if (ime.Equals("") || ime.Equals(string.Empty))
                throw new ArgumentException(nameof(ime));

            if (prezime.Equals("") || prezime.Equals(string.Empty))
                throw new ArgumentException(nameof(prezime));

            if (jmbg < 0)
                throw new ArgumentOutOfRangeException(nameof(jmbg));

            Jmbg = jmbg;
            Ime = ime;
            Prezime = prezime;
        }

        public static string GetHeader()
        {
            return string.Format("{0, -15} {1, -15} {2, -15}", "JMBG OSOBE", "IME OSOBE", "PREZIME OSOBE");

        }

        public override string ToString()
        {
            return string.Format("{0, -15} {1, -15} {2, -15}\n", Jmbg, Ime, Prezime);
        }
    }
}
