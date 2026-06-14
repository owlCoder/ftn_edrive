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

namespace Projekat
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void prvaApoteka_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            PrvaApoteka pa = new PrvaApoteka();
            pa.ShowDialog();
        }

        private void drugaApoteka_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            DrugaApoteka da = new DrugaApoteka();
            da.ShowDialog();
        }

        private void trecaApoteka_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            TrecaApoteka ta = new TrecaApoteka();
            ta.ShowDialog();
        }
    }
}
