using System;
using System.ComponentModel;

namespace Zadatak_02_Stavka
{
    public enum VRSTA { HRANA, PICE, OSTALO };
    class Stavka : INotifyPropertyChanged
    {
        private int id;
        private string naziv;
        private double cena;
        private VRSTA vrsta;
        private string opis;

        public event PropertyChangedEventHandler PropertyChanged;

        public Stavka()
        {
            id = 1;
            naziv = "";
            cena = 0.0;
            vrsta = VRSTA.OSTALO;
            opis = "";
        }
        public Stavka(int id, string naziv, double cena, VRSTA vrsta, string opis)
        {
            this.id = id;
            this.naziv = naziv;
            this.cena = cena;
            this.vrsta = vrsta;
            this.opis = opis;
        }
        public int Id
        {
            get { return id; }
            set
            {
                if(id != value)
                {
                    id = value;
                    NotifyPropertyChanged("Id");
                }
            }
        }
        public string Naziv
        {
            get { return naziv; }
            set
            {
                if (naziv != value)
                {
                    naziv = value;
                    NotifyPropertyChanged("Naziv");
                }
            }
        }
        public double Cena
        {
            get { return cena; }
            set
            {
                if(cena != value)
                {
                    cena = value;
                    NotifyPropertyChanged("Cena");
                }
            }
        }
        public VRSTA Vrsta
        {
            get { return vrsta; }
            set
            {
                if(vrsta != value)
                {
                    vrsta = value;
                    NotifyPropertyChanged("Vrsta");
                }
            }
        }
        public string Opis
        {
            get { return opis; }
            set
            {
                if (opis != value)
                {
                    opis = value;
                    NotifyPropertyChanged("Opis");
                }
            }
        }
        private void NotifyPropertyChanged(string v)
        {
            //throw new NotImplementedException();
        }
    }
}
