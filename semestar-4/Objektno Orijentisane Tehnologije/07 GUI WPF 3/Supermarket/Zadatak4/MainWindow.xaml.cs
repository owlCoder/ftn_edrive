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

namespace Zadatak4
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        public MainWindow()
        {
            InitializeComponent();


            Supermarket s = new Supermarket();

            ObservableCollection<Supermarket> marketi = new ObservableCollection<Supermarket>();

            Kategorija z1 = new Kategorija() { Naziv = "Hrana" };
            z1.Dodaj(new Proizvod() { Naziv = "Mleko", Cena = 110.5});
            z1.Dodaj(new Proizvod() { Naziv = "Hleb", Cena = 65 });
            Kategorija z2 = new Kategorija() { Naziv = "Hemija" };
            z2.Dodaj(new Proizvod() { Naziv = "Deterdzent", Cena = 200 });
            z2.Dodaj(new Proizvod() { Naziv = "Dezodorans", Cena = 125.99 });

            s.Naziv = "BOBO";
            s.Dodaj(z1);
            s.Dodaj(z2);

            marketi.Add(s);

            trvProizvodi.ItemsSource = marketi;

        }




    }
}
