using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.Collections.ObjectModel;
using System.Windows.Input;
using System.Windows;

namespace Zadatak4
{ 
    public class AddCommandProduct : ICommand
    {
        private Kategorija kategorija;
        public AddCommandProduct(Kategorija k)
        {
            kategorija = k;
        }

        public bool CanExecute(object parameter)
        {
            return true;
        }

        public event EventHandler CanExecuteChanged;

        public void Execute(object parameter)
        {
            DodavanjeProizvoda dp = new DodavanjeProizvoda(kategorija);
            dp.Show();
        }
    }
    
    public class Kategorija : INotifyPropertyChanged
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

        private AddCommandProduct add;
        public AddCommandProduct AddProduct
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
                    OnPropertyChanged("AddProduct");
                }
            }
        }
        private ObservableCollection<Proizvod> proizvodi;
        public ObservableCollection<Proizvod> Proizvodi
        {
            get
            {
                return proizvodi;
            }
            set
            {
                proizvodi = value;
            }
        }

        public Kategorija()
        {
            naziv = "";
            proizvodi = new ObservableCollection<Proizvod>();
            add = new AddCommandProduct(this);
        }

        public bool Dodaj(Proizvod p)
        {
            foreach (Proizvod proizvod in proizvodi)
            {
                if (p.Naziv.Equals(proizvod.Naziv) || p.Naziv == "")
                    return false;
            }
            proizvodi.Add(p);
            return true;
        }

    }
}
