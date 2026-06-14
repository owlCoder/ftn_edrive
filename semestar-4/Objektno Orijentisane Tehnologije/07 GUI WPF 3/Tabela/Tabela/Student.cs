using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;

namespace Tabela
{
    public class Student: INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;
        public virtual void OnPropertyChanged(string name)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(name));
            }
        }
        private string ime;
        private string prezime;
        private string indeks;
        private string email;
        private bool upisan;
        // polje kreirano radi lepseg ispisa u grupisanju
        private string upisanTekst;
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

        public string Indeks
        {
            get
            {
                return indeks;
            }
            set
            {
                if (value != indeks)
                {
                    indeks = value;
                    OnPropertyChanged("Indeks");
                }
            }
        }

        public string Email
        {
            get
            {
                return email;
            }
            set
            {
                if (value != email)
                {
                    email = value;
                    OnPropertyChanged("Email");
                }
            }
        }

        public bool Upisan
        {
            get
            {
                return upisan;
            }
            set
            {
                if (upisan != value)
                {
                    upisan = value;
                    OnPropertyChanged("Upisan");
                }
            }
        }

        public string UpisanTekst
        { 
            get
            {
                if (upisan)
                    return "Upisani";
                else
                    return "Nisu upisani";
            }

            set
            {
                if (upisanTekst != value)
                {
                    upisanTekst = value;
                    OnPropertyChanged("UpisanTekst");
                }
            }
            
        }
    }
}
