using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evidencija
{
    class Zaposleni
    {
        private int id;
        private string ime;
        private string prezime;
        private int dnevnica;
        private int brojRadnihDana;
        private int bolovanje;

        public Zaposleni(int id, string ime, string prezime, int dnevnica, int brojRadnihDana, int bolovanje)
        {
            this.Id = id;
            this.Ime = ime;
            this.Prezime = prezime;
            this.Dnevnica = dnevnica;
            this.BrojRadnihDana = brojRadnihDana;
            this.Bolovanje = bolovanje;
        }

        public int Id { get => id; set => id = value; }
        public string Ime { get => ime; set => ime = value; }
        public string Prezime { get => prezime; set => prezime = value; }
        public int Dnevnica { get => dnevnica; set => dnevnica = value; }
        public int BrojRadnihDana { get => brojRadnihDana; set => brojRadnihDana = value; }
        public int Bolovanje { get => bolovanje; set => bolovanje = value; }

        public override string ToString()
        {
            return id + ". " + prezime + "\t" + ime + "\t";
        }
    }
}
