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
    public partial class Pregled : Window
    {
        private string SelectedImage = "";

        public Pregled(Brabus trenutni)
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
