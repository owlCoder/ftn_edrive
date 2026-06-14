using System.ComponentModel;

namespace Biblioteka.Knjige
{
    internal class Knjiga : INotifyPropertyChanged
    {
        #region POLJA KLASE KNJIGA
        private int idKnjige;
        private string naziv;
        private string autor;
        private int godinaIzdanja;
        private int idBiblioteke;
        private int idKorisnika;
        private string nijeDodata = "NIJE DODATA";
        #endregion

        #region KONSTRUKTOR KLASE KNJIGA
        public Knjiga(string naziv, string autor, int godinaIzdanja)
        {
            // Knjiga inicijalno ne pripada ni jednoj biblioteci, niti ju je uzeo neki korisnik
            idBiblioteke = -1;
            idKorisnika = -1;
            IdKnjige = App.IdKnjigeCnt;
            App.IdKnjigeCnt++;

            Naziv = naziv;
            Autor = autor;
            GodinaIzdanja = godinaIzdanja;
        }
        #endregion

        #region INOTIFYPROPERTYCHANGED
        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged(string name)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(name));
            }
        }
        #endregion

        #region PROPERTY KLASE KNJIGA
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

        public string Autor
        {
            get
            {
                return autor;
            }

            set
            {
                if (value != autor)
                {
                    autor = value;
                    OnPropertyChanged("Autor");
                }
            }
        }

        public int GodinaIzdanja
        {
            get
            {
                return godinaIzdanja;
            }

            set
            {
                if (value != godinaIzdanja)
                {
                    godinaIzdanja = value;
                    OnPropertyChanged("GodinaIzdanja");
                }
            }
        }

        public string NijeDodata
        {
            get
            {
                return nijeDodata;
            }

            set
            {
                if (value != nijeDodata)
                {
                    nijeDodata = value;
                    OnPropertyChanged("NijeDodata");
                }
            }
        }

        public int IdBiblioteke
        {
            get
            {
                return idBiblioteke;
            }

            set
            {
                if (value != idBiblioteke)
                {
                    idBiblioteke = value;
                    OnPropertyChanged("IdBiblioteke");
                }
            }
        }

        public int IdKorisnika
        {
            get
            {
                return idKorisnika;
            }

            set
            {
                if (value != idKorisnika)
                {
                    idKorisnika = value;
                    OnPropertyChanged("IdKorisnika");
                }
            }
        }
		
        public int IdKnjige
        {
            get
            {
                return idKnjige;
            }

            set
            {
                if (value != idKnjige)
                {
                    idKnjige = value;
                    OnPropertyChanged("IdKnjige");
                }
            }
        }
        #endregion
    }
}
