using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PripremaK1
{
    class Osoba
    {
        private string ime;
        private string prezime;
        public Osoba()
        {
            this.Ime = string.Empty;
            this.Prezime = string.Empty;
        }
        public Osoba(string ime, string prezime)
        {
            this.Ime = ime;
            this.Prezime = prezime;
        }
        public string Ime { get => ime; set => ime = value; }
        public string Prezime { get => prezime; set => prezime = value; }
    }
}
