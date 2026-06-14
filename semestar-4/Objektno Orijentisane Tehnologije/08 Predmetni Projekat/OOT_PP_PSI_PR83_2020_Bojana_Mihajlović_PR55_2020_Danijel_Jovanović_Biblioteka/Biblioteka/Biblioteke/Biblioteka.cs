using System.Collections.ObjectModel;
using System.ComponentModel;

namespace Biblioteka.Biblioteke
{
    internal class Biblioteka : INotifyPropertyChanged
    {
        #region POLJA KLASE BIBLIOTEKA
        private int idBiblioteke;
        private string naziv;
        private string adresa;
        private int godinaOsnivanja;
        private string logoBiblioteke;
        private ObservableCollection<Korisnici.Korisnik> korisnici = new ObservableCollection<Korisnici.Korisnik>();
        private ObservableCollection<Knjige.Knjiga> knjige = new ObservableCollection<Knjige.Knjiga>();
        #endregion

        #region KONSTRUKTOR KLASE BIBLIOTEKA
        public Biblioteka(string naziv, string adresa, int godinaOsnivanja, string logoBiblioteke)
        {
            IdBiblioteke = App.IdCounter;
            App.IdCounter++;

            Naziv = naziv;
            Adresa = adresa;
            GodinaOsnivanja = godinaOsnivanja;
            LogoBiblioteke = logoBiblioteke;
        }
        #endregion

        #region INOTIFYPROPERTYCHANGE
        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged(string name)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(name));
            }
        }
        #endregion

        #region PROPERTY KLASE BIBLIOTEKA
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

        public int GodinaOsnivanja
        {
            get
            {
                return godinaOsnivanja;
            }

            set
            {
                if (value != godinaOsnivanja)
                {
                    godinaOsnivanja = value;
                    OnPropertyChanged("GodinaOsnivanja");
                }
            }
        }

        public string LogoBiblioteke
        {
            get
            {
                return logoBiblioteke;
            }

            set
            {
                if (value != logoBiblioteke)
                {
                    logoBiblioteke = value;
                    OnPropertyChanged("LogoBiblioteke");
                }
            }
        }
		
        public ObservableCollection<Korisnici.Korisnik> Korisnici { get => korisnici; set => korisnici = value; }
        public ObservableCollection<Knjige.Knjiga> Knjige { get => knjige; set => knjige = value; }
        public int IdBiblioteke { get => idBiblioteke; set => idBiblioteke = value; }
        #endregion
    }
}
