using Common;
using System;
using System.Collections.Generic;

namespace Servis
{
    class FizickaLica : IFizickaLica
    {
        static Dictionary<long, Lice> Database = new Dictionary<long, Lice>();
        public void DodajLice(long jmbg, string ime, string prezime)
        {
            if (Database.ContainsKey(jmbg))
            {
                throw new ArgumentException(nameof(jmbg));
            }
            else
            {
                Lice novo = new Lice(jmbg, ime, prezime);
                Database.Add(jmbg, novo);
            }
        }

        public void ObrisiLice(long jmbg)
        {
            if (!Database.ContainsKey(jmbg))
            {
                throw new ArgumentException(nameof(jmbg));
            }
            else
            {
                Database.Remove(jmbg);
            }
        }

        public string SpisakLica()
        {
            string spisak = "";

            foreach (Lice l in Database.Values)
            {
                spisak += l.ToString();
            }

            return spisak;
        }
    }
}
