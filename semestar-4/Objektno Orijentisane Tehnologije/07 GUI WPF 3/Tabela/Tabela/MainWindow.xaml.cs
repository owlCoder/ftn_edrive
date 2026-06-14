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
using System.ComponentModel;
using System.Collections.ObjectModel;

namespace Tabela
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        

        public MainWindow()
        {
            InitializeComponent();

            Sluzba sluzba = new Sluzba();
            sluzba.dodaj(new Student { Ime = "Pera", Prezime = "Peric", Indeks = "PR1/2020", Email = "perap@uns.ac.rs", Upisan = true });
            sluzba.dodaj(new Student { Ime = "Mara", Prezime = "Maric", Indeks = "PR2/2020", Email = "mm123@uns.ac.rs", Upisan = false });
            sluzba.dodaj(new Student { Ime = "Zoran", Prezime = "Zoric", Indeks = "PR3/2020", Email = "zzoki@uns.ac.sr", Upisan = false });
            sluzba.dodaj(new Student { Ime = "Sara", Prezime = "Saric", Indeks = "PR4/2020", Email = "sarasaric@uns.ac.sr", Upisan = true });

            this.DataContext = sluzba;


        }
    }
}
