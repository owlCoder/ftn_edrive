using Common;
using System;
using System.Collections.Generic;

namespace Server
{
    public class Replikator : IReplikator
    {
        public void Posalji(List<Student> studenti)
        {
            foreach (Student s in studenti)
            {
                StudentskaSluzbaServis.studenti[s.BrojIndeksa] = s;
            }

            if(studenti.Count > 0)
                Console.WriteLine("{0} [REPLIKATOR]: BACKUP COMPLETED! Successfully backed up {1} objects!", DateTime.Now.ToString(), studenti.Count);
        }

        public List<Student> Preuzmi(DateTime vremeReplikacije)
        {
            List<Student> studenti = new List<Student>();

            foreach (Student s in StudentskaSluzbaServis.studenti.Values)
            {
                if (s.PoslednjaIzmena >= vremeReplikacije)
                {
                    studenti.Add(s);
                }
            }

            if (studenti.Count > 0)
                Console.WriteLine("{0} [REPLIKATOR]: BACKUP STARTED! Size of delta: {1} objects.", DateTime.Now.ToString(), studenti.Count);

            return studenti;
        }
    }
}
