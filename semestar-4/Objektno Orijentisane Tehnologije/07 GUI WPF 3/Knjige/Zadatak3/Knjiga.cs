using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace Zadatak3
{
    public class Knjiga : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged(string name)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(name));
            }
        }
        private string naslov;
        private string imeAutora;
        private string prezimeAutora;
        private int godinaIzdanja;
        public string Naslov
        {
            get
            {
                return naslov;
            }
            set
            {
                if (value != naslov)
                {
                    naslov = value;
                    OnPropertyChanged("Naslov");
                }
            }
        }

        public string ImeAutora
        {
            get
            {
                return imeAutora;
            }
            set
            {
                if (value != imeAutora)
                {
                    imeAutora = value;
                    OnPropertyChanged("ImeAutora");
                }
            }
        }

        public string PrezimeAutora
        {
            get
            {
                return prezimeAutora;
            }
            set
            {
                if (value != prezimeAutora)
                {
                    prezimeAutora = value;
                    OnPropertyChanged("PrezimeAutora");
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

    }
}
