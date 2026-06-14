using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z2_1
{
    class Student
    {
        private string indeks;
        private string ime;
        private string prezime;

        public string Indeks
        {
            get
            {
                return indeks;
            }

            set
            {
                indeks = value;
            }
        }

        public string Ime
        {
            get
            {
                return ime;
            }

            set
            {
                ime = value;
            }
        }

        public string Prezime
        {
            get
            {
                return prezime;
            }

            set
            {
                prezime = value;
            }
        }

        public Student(string ind, string ime, string prezime)
        {
            this.Indeks = ind;
            this.Ime = ime;
            this.Prezime = prezime;
        }

        public override String ToString()
        {
            return "Student [indeks = " + Indeks + ", ime = " + Ime + ", prezime = " + Prezime + "]";
        }

    }
}
