using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using System.Collections.ObjectModel;
using System.Windows.Input;

namespace Zadatak4
{
    public class AddCommandCategory : ICommand
    {
        private Supermarket supermarket;
        public AddCommandCategory(Supermarket s)
        {
            supermarket = s;
        }

        public bool CanExecute(object parameter)
        {
            return true;
        }

        public event EventHandler CanExecuteChanged;

        public void Execute(object parameter)
        {
            DodavanjeKategorije dk = new DodavanjeKategorije(supermarket);
            dk.Show();
        }
    }
    public class Supermarket : INotifyPropertyChanged
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
        private ObservableCollection<Kategorija> kategorijeProizvoda = new ObservableCollection<Kategorija>();

        public string Naziv
        {
            get { return naziv; }
            set 
            { 
                naziv = value;
                OnPropertyChanged("Naziv");

            }
        }

        private AddCommandCategory add;
        public AddCommandCategory AddCategory
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
                    OnPropertyChanged("AddCategory");
                }
            }
        }

        public ObservableCollection<Kategorija> KategorijeProizvoda
            {
                get
                {
                    return kategorijeProizvoda;
                }
                set
                {
                    kategorijeProizvoda = value;

                 }
            }

        public bool Dodaj(Kategorija k)
        {
            foreach (Kategorija kat in kategorijeProizvoda)
            {
                if (kat.Naziv.Equals(k.Naziv))
                    return false;
            }

            kategorijeProizvoda.Add(k);
            return true;
        }

        public Supermarket()
        {
            AddCategory = new AddCommandCategory(this);
        }
    }
}
