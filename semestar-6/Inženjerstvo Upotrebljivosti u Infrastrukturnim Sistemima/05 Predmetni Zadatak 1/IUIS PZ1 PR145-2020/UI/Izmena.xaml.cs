using Common;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace UI
{
    public partial class Izmena : Window
    {
        private string SelectedImage = "";
        private Brabus zaIzmenu = null;

        public Izmena(Brabus trenutni)
        {
            InitializeComponent();

            cmbFontFamily.ItemsSource = Fonts.SystemFontFamilies.OrderBy(f => f.Source);
            Type t = typeof(Colors);

            cboColors.ItemsSource = t.GetProperties();
            cboColors.SelectedItem = t.GetProperty("Black");

            for (int i = 2; i <= 32; i += 2)
            {
                cmbFontSize.Items.Add(i);
            }

            cmbFontSize.Items.Add(40);
            cmbFontSize.Items.Add(50);
            cmbFontSize.Items.Add(60);
            cmbFontSize.Items.Add(80);
            cmbFontSize.SelectedIndex = 5;

            SelectedImage = trenutni.Slika;

            zaIzmenu = trenutni;

            // popuniti polja
            hiperlink.Text = trenutni.Hiperlink;
            model.Text = trenutni.ModelAuta;
            pogon.Text = trenutni.Pogon;
            godina.Text = trenutni.GodinaProizvodnje.ToString();
            slika.Source = new BitmapImage(new Uri(SelectedImage, UriKind.Absolute));

            // ucitavanje rtf fajla
            TextRange tt = new TextRange(rtbEditor.Document.ContentStart, rtbEditor.Document.ContentEnd);
            FileStream file = new FileStream(trenutni.RtfFajl, FileMode.Open);
            tt.Load(file, System.Windows.DataFormats.XamlPackage);
            file.Close();
        }

        private void IzmeniBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                string poruka = string.Empty;
                int godina_i = 0;

                if (hiperlink.Text.Trim().Equals("") || hiperlink.Text.Trim().Equals(string.Empty))
                {
                    poruka = "Hiperlink ne sme biti prazno polje!";
                }
                else if (model.Text.Trim().Equals("") || model.Text.Trim().Equals(string.Empty))
                {
                    poruka = "Model ne sme biti prazno polje!";
                }
                else if (pogon.Text.Trim().Equals("") || pogon.Text.Trim().Equals(string.Empty))
                {
                    poruka = "Pogon ne sme biti prazno polje!";
                }
                else if (godina.Text.Trim().Equals("") || godina.Text.Trim().Equals(string.Empty))
                {
                    poruka = "Godina ne sme biti prazno polje!";
                }
                else if (SelectedImage.Trim().Equals("") || SelectedImage.Trim().Equals(string.Empty))
                {
                    poruka = "Slika mora biti odabrana!";
                }
                else
                {
                    // sve je okej
                    bool ok = Int32.TryParse(godina.Text.Trim(), out godina_i);

                    if (ok)
                    {
                        if (godina_i <= 1900)
                        {
                            poruka = "Godina ne sme biti negativan broj!";
                        }
                    }
                    else
                    {
                        poruka = "Niste uneli broj za godinu!";
                    }
                }

                if (!poruka.Equals(string.Empty))
                {
                    MessageBox.Show(poruka, "Pogrešno popunjena forma");
                    return;
                }

                Brabus novi = new Brabus(hiperlink.Text.Trim(), SelectedImage, model.Text.Trim(), pogon.Text.Trim(), godina_i);

                zaIzmenu.Hiperlink = novi.Hiperlink;
                zaIzmenu.ZaBrisanje = novi.ZaBrisanje;
                zaIzmenu.Datum = novi.Datum;
                zaIzmenu.ModelAuta = novi.ModelAuta;
                zaIzmenu.Pogon = novi.Pogon;
                zaIzmenu.GodinaProizvodnje = novi.GodinaProizvodnje;
                zaIzmenu.Slika = novi.Slika;
                zaIzmenu.RtfFajl = novi.RtfFajl;

                // cuvanje podataka na disk
                Sacuvaj.SacuvajPodatke(Prijava.Automobili);

                MessageBox.Show("Automobil uspešno izmenjen!", "Uspešna izmena", MessageBoxButton.OK, MessageBoxImage.Information);

                // save rtf file
                TextRange t = new TextRange(rtbEditor.Document.ContentStart, rtbEditor.Document.ContentEnd);
                FileStream file = new FileStream(novi.RtfFajl, FileMode.Create);
                t.Save(file, System.Windows.DataFormats.XamlPackage);
                file.Close();

                Close();
            }
            catch (Exception) { }
        }

        private void ExitBtn_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void CmbFontFamily_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (cmbFontFamily.SelectedItem != null && !rtbEditor.Selection.IsEmpty)
            {
                rtbEditor.Selection.ApplyPropertyValue(Inline.FontFamilyProperty, cmbFontFamily.SelectedItem);
            }
        }

        private void RtbEditor_TextChanged(object sender, TextChangedEventArgs e)
        {
            TextRange docContent = new TextRange(rtbEditor.Document.ContentStart, rtbEditor.Document.ContentEnd);

            brojReci.Text = "  Broj reči: " + (Regex.Matches(docContent.Text, @"[\S]+").Count).ToString();
        }

        private void RtbEditor_SelectionChanged(object sender, RoutedEventArgs e)
        {
            object temp = rtbEditor.Selection.GetPropertyValue(Inline.FontWeightProperty);
            BtnBold.IsChecked = temp.Equals(FontWeights.Bold) && temp != DependencyProperty.UnsetValue;

            // font family
            temp = rtbEditor.Selection.GetPropertyValue(Inline.FontFamilyProperty);
            cmbFontFamily.SelectedItem = temp;

            // italic
            temp = rtbEditor.Selection.GetPropertyValue(Inline.FontStyleProperty);
            BtnItalic.IsChecked = temp.Equals(FontStyles.Italic) && temp != DependencyProperty.UnsetValue;

            // underline
            temp = rtbEditor.Selection.GetPropertyValue(Inline.TextDecorationsProperty);
            BtnUnderline.IsChecked = temp.Equals(TextDecorations.Underline) && temp != DependencyProperty.UnsetValue;

            // font size
            temp = rtbEditor.Selection.GetPropertyValue(Inline.FontSizeProperty);
            cmbFontSize.Text = temp.ToString();

            // slicno i za boju fonta
            temp = rtbEditor.Selection.GetPropertyValue(Inline.ForegroundProperty);
            cboColors.SelectedItem = temp;

            rtbEditor.Focus();
        }

        private void CboColors_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            RichTextBox rtb = rtbEditor;

            if (rtb != null && rtb.Selection is TextSelection)
            {
                try
                {
                    var trenutna_boja = cboColors.SelectedValue;
                    SolidColorBrush new_color = new SolidColorBrush((Color)((PropertyInfo)trenutna_boja).GetValue(null, null));
                    rtb.Selection.ApplyPropertyValue(TextElement.ForegroundProperty, new_color);

                    rtb.Focus();
                }
                catch { }
            }
        }

        private void CmbFontSize_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (cmbFontSize.SelectedItem != null && !rtbEditor.Selection.IsEmpty)
            {
                rtbEditor.Selection.ApplyPropertyValue(Inline.FontSizeProperty, Convert.ToDouble(cmbFontSize.SelectedItem));
            }
        }

        private void SlikaBtn_Click(object sender, RoutedEventArgs e)
        {
            // Create OpenFileDialog 
            Microsoft.Win32.OpenFileDialog dlg = new Microsoft.Win32.OpenFileDialog
            {
                DefaultExt = ".jpg",
                Filter = "JPG Files (*.jpg)|*.jpg"
            };

            bool? result = dlg.ShowDialog();

            if (result == true)
            {
                SelectedImage = dlg.FileName;

                slika.Source = new BitmapImage(new Uri(SelectedImage, UriKind.Absolute));
            }
            else
            {
                SelectedImage = "";
                slika.Source = new BitmapImage(new Uri("resursi/placeholder.png", UriKind.Relative));
            }
        }
    }
}
