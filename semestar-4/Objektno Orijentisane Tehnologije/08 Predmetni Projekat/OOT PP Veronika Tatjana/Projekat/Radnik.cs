using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Projekat
{
    internal class Radnik : INotifyPropertyChanged
    {
        private string ime;
        private string prezime;
        private string jmbg;
        private string slika;
        private string datumPocetkaRada;

        public Radnik(string ime, string prezime, string jmbg, string slika, string datumPocetkaRada)
        {
            this.ime = ime;
            this.prezime = prezime;
            this.jmbg = jmbg;
            this.slika = slika;
            this.datumPocetkaRada = datumPocetkaRada;
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged(string name)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(name));
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
                if (value != ime)
                {
                    ime = value;
                    OnPropertyChanged("Ime");
                }
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
                if (value != prezime)
                {
                    prezime = value;
                    OnPropertyChanged("Prezime");
                }
            }
        }
        public string Jmbg
        {
            get
            {
                return jmbg;
            }

            set
            {
                if (value != jmbg)
                {
                    jmbg = value;
                    OnPropertyChanged("Jmbg");
                }
            }
        }
        public string Slika
        {
            get
            {
                return slika;
            }

            set
            {
                if (value != slika)
                {
                    slika = value;
                    OnPropertyChanged("Slika");
                }
            }
        }

        public string DatumPocetkaRada
        {
            get
            {
                return datumPocetkaRada;
            }

            set
            {
                if (value != datumPocetkaRada)
                {
                    datumPocetkaRada = value;
                    OnPropertyChanged("DatumPocetkaRada");
                }
            }
        }
    }
}
