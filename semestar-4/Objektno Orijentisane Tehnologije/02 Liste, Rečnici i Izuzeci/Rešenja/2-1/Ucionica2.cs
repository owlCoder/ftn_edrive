using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z2_1
{
    class UcionicaMap
    {
        private Dictionary<string, Student> studenti = new Dictionary<string, Student>();
        private const int kapacitet = 5;

        public void DodajStudenta(Student s)
        {
            if (studenti.Count < kapacitet)
            {
                studenti.Add(s.Indeks, s);
            }
            // ako se pokuša sa dodavanjem studenta koji ima isti indeks doći će do greške (izuzetak)
        }

        // Kod recnika se ne pristupa, pa ni ne izbacuje, preko indeksa. To nije namena.
        // Pristup se radi preko ključa
        public void UkloniStudenta(string indeks)
        {
            studenti.Remove(indeks);
        }

        public void IsprazniUcionicu()
        {
            studenti.Clear();
        }

        public override string ToString()
        {
            string pom = "";

            // u recniku ne koristimo for (ne znamo raspored)
            foreach (Student s in studenti.Values)
            {
                pom += s + "\n   ";
            }

            return "Ucionica2 [studenti= \n   " + pom + ", kapacitet=" + kapacitet + "]";
        }
    }
}
