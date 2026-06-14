using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z2_1
{
    class Ucionica
    {
        private List<Student> studenti = new List<Student>();
        private const int kapacitet = 5; // moze i readonly (jedno u compile time, drugo u run time)


        public void DodajStudenta(Student s)
        {
            if (studenti.Count < kapacitet)
            {
                studenti.Add(s);
            }

            // moze i ovako
            //else
            //    throw new Exception("Nema vise mesta u ucionici");
        }

        // Uklanja studenta za zadate pozicije. 
        public void UkloniStudenta(int i)
        {
             studenti.RemoveAt(i);
        }

        public void IsprazniUcionicu()
        {
            studenti.Clear();
        }

        public override string ToString()
        {
            if (studenti.Count == 0)
                return "Ucionica je prazna";

            string pom = "";

            // u listi moze da se koristi i for
            foreach (Student s in studenti)
            {
                pom += s + "\n   ";
            }

            return "Ucionica: \n   " + pom;
        }
    }
}
