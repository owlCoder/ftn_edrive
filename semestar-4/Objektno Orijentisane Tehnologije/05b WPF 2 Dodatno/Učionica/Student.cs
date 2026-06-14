using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ucionica
{
    class Student
    {
        private int id;
        private string ime;
        private string prezime;
        private string brojIndeksa;

        Student()
        {

        }

        public Student(int id, string ime, string prezime, string brojIndeksa)
        {
            this.id = id;
            this.ime = ime;
            this.prezime = prezime;
            this.brojIndeksa = brojIndeksa;
        }

        public int Id { get => id; set => id = value; }
        public string Ime { get => ime; set => ime = value; }
        public string Prezime { get => prezime; set => prezime = value; }
        public string BrojIndeksa { get => brojIndeksa; set => brojIndeksa = value; }
    }
}
