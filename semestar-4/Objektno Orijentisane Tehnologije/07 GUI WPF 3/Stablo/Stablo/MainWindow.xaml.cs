using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Collections.ObjectModel;

namespace Stablo
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public ObservableCollection<Zanr> Zanrovi
        {
            get;
            set;
        }

        public MainWindow()
        {
            InitializeComponent();
            this.DataContext = this;
            Zanrovi = new ObservableCollection<Zanr>();
            Zanr z1 = new Zanr() { Naziv = "Trileri" };
            z1.Knjige.Add(new Knjiga() { Naslov = "Agent 6", ImeAutora = "Tom Rob", PrezimeAutora = "Smit", GodinaIzdanja = 2009});
            z1.Knjige.Add(new Knjiga() { Naslov = "Vin", ImeAutora = "Harlan", PrezimeAutora = "Koben", GodinaIzdanja = 2021});
            Zanrovi.Add(z1);
            Zanr z2 = new Zanr() { Naziv = "Drama" };
            z2.Knjige.Add(new Knjiga() { Naslov = "Una", ImeAutora = "Momo", PrezimeAutora = "Kapor", GodinaIzdanja = 2021 });
            z2.Knjige.Add(new Knjiga() { Naslov = "Dorotej", ImeAutora = "Dobrilo", PrezimeAutora = "Nenadovic", GodinaIzdanja = 2017 });
            Zanrovi.Add(z2);
        }


    }
}
