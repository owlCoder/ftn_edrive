using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zadatak_01_Studenti
{
    class Student : INotifyPropertyChanged
    {
        private string ime;
        private string prezime;
        private string indeks;
        public event PropertyChangedEventHandler PropertyChanged;

        public Student()
        {
            Ime = "";
            Prezime = "";
            Indeks = "";
        }
        public Student(string ime, string prezime, string indeks)
        {
            Ime = ime;
            Prezime = prezime;
            Indeks = indeks;
        }
        public string Indeks
        {
            get { return indeks; }
            set
            {
                if (indeks != value)
                {
                    indeks = value;
                    NotifyPropertyChanged("Indeks");
                }
            }
        }
        public string Ime
        {
            get { return ime; }
            set
            {
                if (ime != value)
                {
                    ime = value;
                    NotifyPropertyChanged("Ime");
                }
            }
        }

        public string Prezime
        {
            get { return prezime; }
            set
            {
                if (prezime != value)
                {
                    prezime = value;
                    NotifyPropertyChanged("Prezime");
                }
            }
        }

        public void NotifyPropertyChanged(string prop)
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}
