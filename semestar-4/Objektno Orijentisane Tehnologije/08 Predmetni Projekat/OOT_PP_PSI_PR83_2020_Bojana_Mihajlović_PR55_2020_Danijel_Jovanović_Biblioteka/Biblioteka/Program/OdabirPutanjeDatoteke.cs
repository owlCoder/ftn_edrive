using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media.Imaging;

namespace Biblioteka.Program
{
    internal class OdabirPutanjeDatoteke
    {
        private string trenutnaPutanja = string.Empty;

        public string Odabir_Putanje(string klasa, Image logo)
        {
            var dialog = new Microsoft.Win32.OpenFileDialog();
            dialog.FileName = "";
            dialog.DefaultExt = ".png";
            dialog.Filter = "SLIKA (.png)|*.png";

            bool? result = dialog.ShowDialog();

            if (result == true)
            {
                trenutnaPutanja = dialog.FileName;
                logo.Source = new BitmapImage(new Uri(trenutnaPutanja, UriKind.Absolute));
            }
            else
            {
                MessageBox.Show("Niste odabrali sliku " + klasa + "!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
                logo.Source = new BitmapImage(new Uri("/Slike/placeholder.png", UriKind.Relative));
                trenutnaPutanja = string.Empty;
            }

            return trenutnaPutanja;
        }
    }
}
