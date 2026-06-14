using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Z5
{
    class CDDisk
    {
        private int id;
        private string naziv;
        private string izvodjac;
        
        public CDDisk(int id = 0, string naziv = "nepoznat", string izvodjac = "nepoznat")
        {
            this.id = id;
            this.naziv = naziv;
            this.izvodjac = izvodjac;
        }

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public string Naziv
        {
            get { return naziv; }
            set { naziv = value; }
        }

        public string Izvodjac
        {
            get { return izvodjac; }
            set { izvodjac = value; }
        }

        public override String ToString()
        {
            return "CD [" + id + ", " + naziv + ", " + izvodjac+ "]";
        }
    }
}
