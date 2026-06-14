using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Apoteka_OOT
{
    class Lek : INotifyPropertyChanged
    {
        private string naziv;
        private string datumProizvodnje;
        private string datumVazenja;
        private int kolicina;

        public Lek(string naziv, string datumProizvodnje, string datumVazenja, int kolicina)
        {
            this.naziv = naziv;
            this.datumProizvodnje = datumProizvodnje;
            this.datumVazenja = datumVazenja;
            this.kolicina = kolicina;
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged(string name)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(name));
            }
        }

        public string Naziv
        {
            get
            {
                return naziv;
            }

            set
            {
                if (value != naziv)
                {
                    naziv = value;
                    OnPropertyChanged("Naziv");
                }
            }
        }

        public string DatumProizvodnje
        {
            get
            {
                return datumProizvodnje;
            }

            set
            {
                if (value != datumProizvodnje)
                {
                    datumProizvodnje = value;
                    OnPropertyChanged("DatumProizvodnje");
                }
            }
        }

        public string DatumVazenja
        {
            get
            {
                return datumVazenja;
            }

            set
            {
                if (value != datumVazenja)
                {
                    datumVazenja = value;
                    OnPropertyChanged("DatumVazenja");
                }
            }
        }
        public int Kolicina
        {
            get
            {
                return kolicina;
            }

            set
            {
                if (value != kolicina)
                {
                    kolicina = value;
                    OnPropertyChanged("Kolicina");
                }
            }
        }
    }
}
