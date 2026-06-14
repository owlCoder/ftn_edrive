using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Apoteka_OOT
{
    class Apoteka : INotifyPropertyChanged
    {
        private string naziv;
        private string adresa;
        private int godina;
        private string slika;

        ObservableCollection<Radnik> radnici = new ObservableCollection<Radnik>();
        ObservableCollection<Lek> lekovi = new ObservableCollection<Lek>();

        public Apoteka(string naziv, string adresa, int godina, string slika)
        {
            this.naziv = naziv;
            this.adresa = adresa;
            this.godina = godina;
            this.slika = slika;
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
        public string Adresa
        {
            get
            {
                return adresa;
            }

            set
            {
                if (value != adresa)
                {
                    adresa = value;
                    OnPropertyChanged("Adresa");
                }
            }
        }
        public int Godina
        {
            get
            {
                return godina;
            }

            set
            {
                if (value != godina)
                {
                    godina = value;
                    OnPropertyChanged("Godina");
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
        internal ObservableCollection<Radnik> Radnici { get => radnici; set => radnici = value; }
        internal ObservableCollection<Lek> Lekovi { get => lekovi; set => lekovi = value; }
    }
}
