using System;
using System.Collections.Generic;
using System.ComponentModel;
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

namespace DragAndDrop
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private Slika draggedItem = null;
        private bool dragging = false;
        private int selected;

        public BindingList<SlikePoEkstenziji> SveSlike { get; set; }

        public MainWindow()
        {
            InitializeComponent();

            SveSlike = new BindingList<SlikePoEkstenziji>();

            SlikePoEkstenziji jpgSlike = new SlikePoEkstenziji() { Ekstenzija = "JPG" };
            jpgSlike.Slike.Add(new Slika() { ImeDatoteke = "Elektrifikacija.jpg", Putanja = "../../Slike/Elektrifikacija.jpg" });
            jpgSlike.Slike.Add(new Slika() { ImeDatoteke = "Industrija.jpg", Putanja = "../../Slike/Industrija.jpg" });
            SveSlike.Add(jpgSlike);

            SlikePoEkstenziji pngSlike = new SlikePoEkstenziji() { Ekstenzija = "PNG" };
            pngSlike.Slike.Add(new Slika() { ImeDatoteke = "ElektroMreza.png", Putanja = "../../Slike/ElektroMreza.png" });
            pngSlike.Slike.Add(new Slika() { ImeDatoteke = "SkladistenjeEnergije.png", Putanja = "../../Slike/SkladistenjeEnergije.png" });
            SveSlike.Add(pngSlike);

            //listaSlika.ItemsSource = sveSlike;
            DataContext = this;
        }

        private void listaSlika_SelectedItemChanged(object sender, RoutedPropertyChangedEventArgs<object> e)
        {
            
        }

        private void listaSlika_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            
        }

        private void canvas1_DragOver(object sender, DragEventArgs e)
        {
            
        }

        private void canvas1_Drop(object sender, DragEventArgs e)
        {
            
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            
        }
    }
}
