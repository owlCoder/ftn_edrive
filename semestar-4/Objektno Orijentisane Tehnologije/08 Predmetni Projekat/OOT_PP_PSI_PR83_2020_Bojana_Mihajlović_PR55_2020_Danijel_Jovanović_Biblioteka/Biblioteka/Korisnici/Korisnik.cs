using System.ComponentModel;

namespace Biblioteka.Korisnici
{
    internal class Korisnik : INotifyPropertyChanged
    {
        #region POLJA KLASE KORISNIK
        private int idKorisnika;
        private int idBiblioteke;
        private string ime;
        private string prezime;
        private string jmbg;
        private string profilnaSlika;
        private string datumUclanjenja;
        private string uclanjen;

        // Polje idKnjige nije dodato jer se na osnovu idBiblioteke mogu pronaći sve knjige koje je korisnik pozajmio iz te biblioteke
        #endregion

        #region KONSTRUKTOR KLASE KORISNIK
        public Korisnik(string ime, string prezime, string jmbg, string profilnaSlika, string datumUclanjenja)
        {
            // Korisnik inicijalno nije učlanjen ni u jednu biblioteku
            IdBiblioteke = -1;
            IdKorisnika = App.IdKorisnikaCnt;
            App.IdKorisnikaCnt++;

            Ime = ime;
            Prezime = prezime;
            Jmbg = jmbg;
            ProfilnaSlika = profilnaSlika;
            DatumUclanjenja = datumUclanjenja;
            uclanjen = "/";
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

        #region PROPERTY KLASE KORISNIK
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

        public string ProfilnaSlika
        {
            get
            {
                return profilnaSlika;
            }

            set
            {
                if (value != profilnaSlika)
                {
                    profilnaSlika = value;
                    OnPropertyChanged("ProfilnaSlika");
                }
            }
        }

        public string DatumUclanjenja
        {
            get
            {
                return datumUclanjenja;
            }

            set
            {
                if (value != datumUclanjenja)
                {
                    datumUclanjenja = value;
                    OnPropertyChanged("DatumUclanjenja");
                }
            }
        }

        public string Uclanjen
        {
            get
            {
                return uclanjen;
            }

            set
            {
                if (value != uclanjen)
                {
                    uclanjen = value;
                    OnPropertyChanged("Uclanjen");
                }
            }
        }
		
        public int IdKorisnika { get => idKorisnika; set => idKorisnika = value; }
        public int IdBiblioteke { get => idBiblioteke; set => idBiblioteke = value; }
        #endregion
    }
}