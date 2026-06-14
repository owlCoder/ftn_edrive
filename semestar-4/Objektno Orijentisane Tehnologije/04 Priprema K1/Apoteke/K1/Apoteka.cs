using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace K1
{
    [Serializable]
    class Apoteka
    {
        private Dictionary<string, Artikal> apoteka1;
        private Dictionary<string, Artikal> apoteka2;

        public Apoteka()
        {
            apoteka1 = new Dictionary<string, Artikal>();
            apoteka2 = new Dictionary<string, Artikal>();
        }

        public bool Dodaj(int apoteka, Artikal artikal)
        {
            if(apoteka == 1)
            {
                if(!apoteka1.ContainsKey(artikal.Sifra))
                {
                    apoteka1.Add(artikal.Sifra, artikal);
                    return true;
                }
                return false;
            }
            else
            {
                if (!apoteka2.ContainsKey(artikal.Sifra))
                {
                    apoteka2.Add(artikal.Sifra, artikal);
                    return true;
                }
                return false;
            }
        }

        public override string ToString()
        {
            string str = "";

            str += "\n---------------- APOTEKA 1 -----------------\n";
            if(apoteka1.Count == 0)
                str += "\t    Apoteka je prazna!";
            else
                foreach (Artikal a in apoteka1.Values)
                    str += a.ToString() + "\n";

            str += "\n---------------------------------------------\n";

            str += "\n---------------- APOTEKA 2 -----------------\n";
            if (apoteka2.Count == 0)
                str += "\t    Apoteka je prazna!";
            else
                foreach (Artikal a in apoteka2.Values)
                    str += a.ToString() + "\n";
            str += "\n---------------------------------------------\n";

            return str;
        }
    }
}
