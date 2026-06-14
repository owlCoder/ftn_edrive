using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.Collections.ObjectModel;
using System.Windows.Input;
using System.Windows;

namespace Zadatak3
{ 
    public class AddCommand : ICommand
    {
        private Zanr zanr;
        public AddCommand(Zanr z)
        {
            zanr = z;
        }

        public bool CanExecute(object parameter)
        {
            return true;
        }

        public event EventHandler CanExecuteChanged;

        public void Execute(object parameter)
        {
            DodavanjeKnjige dk = new DodavanjeKnjige(zanr);
            dk.Show();
        }
    }
    
    public class Zanr : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged(string name)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(name));
            }
        }

        private string naziv;
        public string Naziv
        {
            get
            {
                return naziv;
            }
            set
            {
                if (naziv != value)
                {
                    naziv = value;
                    OnPropertyChanged("Naziv");
                }
            }
        }

        private AddCommand add;
        public AddCommand Add
        {
            get
            {
                return add;
            }
            set
            {
                if (add != value)
                {
                    add = value;
                    OnPropertyChanged("Add");
                }
            }
        }

        public ObservableCollection<Knjiga> Knjige
        {
            get;
            set;
        }

        public Zanr()
        {
            Naziv = "";
            Knjige = new ObservableCollection<Knjiga>();
            Add = new AddCommand(this);
        }

        public bool Dodaj(Knjiga k)
        {
            foreach (Knjiga knjiga in Knjige)
            {
                if (k.Naslov.Equals(knjiga.Naslov) && k.GodinaIzdanja == knjiga.GodinaIzdanja)
                    return false;
            }
            Knjige.Add(k);
            return true;
        }

    }
}
