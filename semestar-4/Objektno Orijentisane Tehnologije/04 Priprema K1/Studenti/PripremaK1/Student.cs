using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PripremaK1
{
    class Student : Osoba
    {
        private string smer;
        private int brIndeksa;
        private int godinaUpisa;
        public Student() : base()
        {
            this.Smer = string.Empty;
            this.BrIndeksa = 0;
            this.GodinaUpisa = 0;
        }
        public Student(string ime, string prezime, string smer, int brIndeksa, int godinaUpisa) : base(ime, prezime)
        {
            this.Smer = smer;
            this.BrIndeksa = brIndeksa;
            this.GodinaUpisa = godinaUpisa;
        }

        public override bool Equals(object obj)
        {
            if (obj == null)
            {
                return false;
            }
            else if (!(obj is Student))
            {
                return false;
            }
            else
            {
                return (obj is Student) &&
                   (this.Ime == ((Student)obj).Ime) &&
                   (this.Prezime == ((Student)obj).Prezime) &&
                   (this.BrIndeksa == ((Student)obj).BrIndeksa) &&
                   (this.Smer == ((Student)obj).Smer) &&
                   (this.GodinaUpisa == ((Student)obj).GodinaUpisa);
            }
                   
        }

        public override string ToString()
        {
            string str = string.Empty;

            str = "------------- STUDENT -------------\n\tIme: " + Ime + "\n\tPrezime: " + Prezime + "\n\tIndeks: " + BrIndeksa
                + "\n\tGodina Upisa: " + GodinaUpisa + "\n\tSmer: " + smer + "\n";

            return str;
        }

        public string Smer { get => smer; set => smer = value; }
        public int BrIndeksa { get => brIndeksa; set => brIndeksa = value; }
        public int GodinaUpisa { get => godinaUpisa; set => godinaUpisa = value; }
    }
}
