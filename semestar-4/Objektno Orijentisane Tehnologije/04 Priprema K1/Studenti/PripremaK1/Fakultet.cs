using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PripremaK1
{
    class Fakultet
    {
        private List<Student> studenti;
        public Fakultet()
        {
            studenti = new List<Student>();
        }

        public void UpisiStudente(string putanja)
        {
            string datoteka = App.LoadFromFile(putanja);
            string[] splitNoviRed = datoteka.Split(';');

            for(int i = 0; i < splitNoviRed.Length - 1; i++)
            {
                string[] delovi = splitNoviRed[i].Split(',');
                string smer = delovi[2].Split('-')[0];
                int brojIndeksa = Int32.Parse(delovi[2].Split('-')[1].Split('/')[0]);
                int godinaUpisa = Int32.Parse(delovi[2].Split('-')[1].Split('/')[1].Substring(0, 4));
                
                Student tmp = new Student(delovi[0], delovi[1], smer, brojIndeksa, godinaUpisa);
                studenti.Add(tmp);
            }
        }

        public void SortirajStudente()
        {
            Student s1, s2;

            for(int i = 0; i < studenti.Count - 1; i++)
                for(int j = i + 1; j < studenti.Count; j++)
                {
                    if (studenti[i].GodinaUpisa > studenti[j].GodinaUpisa)
                    {
                        s1 = studenti[i];
                        s2 = studenti[j];

                        studenti.RemoveAt(j);
                        studenti.Insert(j, s1);
                        studenti.RemoveAt(i);
                        studenti.Insert(i, s2);
                    }
                    else if ((studenti[i].GodinaUpisa == studenti[j].GodinaUpisa) &&
                        (studenti[i].BrIndeksa > studenti[j].BrIndeksa) )
                        {
                        s1 = studenti[i];
                        s2 = studenti[j];

                        studenti.RemoveAt(j);
                        studenti.Insert(j, s1);
                        studenti.RemoveAt(i);
                        studenti.Insert(i, s2);
                    }
                }
        }
        public override string ToString()
        {
            if(studenti.Count == 0)
            {
                return "NIKO NIJE UPISAN NA FAKULTET!";
            }

            string str = string.Empty;

            foreach(Student s in studenti)
            {
                str += s.ToString() + "\n";
            }

            return str;
        }
    }
}
