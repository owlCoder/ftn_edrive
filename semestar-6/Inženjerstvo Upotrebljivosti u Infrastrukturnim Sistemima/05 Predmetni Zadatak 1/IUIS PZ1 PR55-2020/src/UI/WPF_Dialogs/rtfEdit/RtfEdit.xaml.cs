using Common;
using Common.API.Prototypes.PrototypeService;
using Common.Constants;
using Common.Models;
using System;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using UI.WPF_Dialogs.msgBox;

namespace UI.WPF_Dialogs.add
{
    public partial class RtfEdit : Window
    {
        #region CLASS FIELDS
        private string Mode;
        private long CurrentImei;
        private string SelectedImage = "";
        private string CurrentImage = "";
        private string CurrentRtfPath = "";
        #endregion

        #region CLASS CONSTRUCTOR
        public RtfEdit(string mode = "Dodavanje", MobileDevice current = null)
        {
            InitializeComponent();

            // save current window mode
            Mode = mode;
            PrepareToolBar();

            PrepareForm(mode, current);

            Title = Title = ProgramInformation.BussinessName + " " + ProgramInformation.EngineVersion + " | " + mode + " članka";
        }
        #endregion

        #region BUTTONS CLICK METHODS
        private void DodajBtn_Click(object sender, RoutedEventArgs e)
        {
            if (CheckFields())
            {
                long imei_l;
                string model_s, memorija_s, extsrc_s;
                GetDataFromForm(out imei_l, out model_s, out memorija_s, out extsrc_s);

                MobileDevice novi = new MobileDevice(imei_l, model_s, memorija_s, SelectedImage, "", extsrc_s, DateTime.Now, true);
                bool result = PrototypeService.CreatePrototype.AddNewPrototype(novi);

                SaveRtfToDisk(novi.RtfPathAssembly);

                if (result)
                {
                    MsgBox.Show("Uspešno dodavanje prototipa", "Prototip je uspešno dodat u bazu podataka!", MsgBoxIcon.Information, MsgBoxIconColor.Information);
                    ClearFields();
                    return;
                }
                else
                {
                    MsgBox.Show("Greška prilikom dodavanja", "Prototip nije uspešno dodat!\nPrototip sa unetim IMEI već postoji!", MsgBoxIcon.Error, MsgBoxIconColor.Error);
                    return;
                }
            }
        }

        private void IzmeniBtn_Click(object sender, RoutedEventArgs e)
        {
            if (CheckFields())
            {
                long imei_l;
                string model_s, memorija_s, extsrc_s;
                GetDataFromForm(out imei_l, out model_s, out memorija_s, out extsrc_s);

                if (SelectedImage.Equals(""))
                {
                    SelectedImage = CurrentImage;
                }

                MobileDevice novi = new MobileDevice(CurrentImei, model_s, memorija_s, SelectedImage, CurrentRtfPath, extsrc_s, DateTime.Now, false);
                bool result = PrototypeService.EditPrototype.EditPrototype(CurrentImei, novi);

                SaveRtfToDisk(novi.RtfPathAssembly);

                if (result)
                {
                    MsgBox.Show("Uspešna izmena prototipa", "Prototip je uspešno izmenjen u bazi podataka!", MsgBoxIcon.Information, MsgBoxIconColor.Information);
                    ClearFields();
                    Close();
                    return;
                }
                else
                {
                    MsgBox.Show("Greška prilikom izmene", "Prototip nije uspešno izmenjen!\nPrototip nije moguće izmeniti!", MsgBoxIcon.Error, MsgBoxIconColor.Error);
                    return;
                }
            }
        }

        private void ExitBtn_Click(object sender, RoutedEventArgs e)
        {
            string display_message;

            if (Mode.Equals(EditModes.Preview))
            {
                display_message = "Da li  želite da izađete iz pregleda članka?";
            }
            else if (Mode.Equals(EditModes.Edit))
            {
                display_message = "Da li želite da izađete iz režima uređivanja?\nPromene neće biti sačuvane!";
            }
            else
            {
                display_message = "Da li želite da odustanete od dodavanja novog prototipa u bazu podataka?\nPodaci neće biti sačuvani!";
            }

            MsgBox.Show("Povratak na Dashboard?", display_message, MsgBoxIcon.Question, MsgBoxIconColor.Question);

            var result = MsgBox.DaPritisnuto;

            if (result)
            {
                Close();
            }
        }
        #endregion

        #region METHODS TO WORK WITH FORM DATA
        private bool CheckFields()
        {
            string naslov = "Pogrešno popunjena forma!";
            string poruka = string.Empty;
            long imei_out;

            if (imei.Text.Trim().Equals("") || imei.Text.Trim().Equals(string.Empty))
            {
                poruka = "IMEI broj polje ne sme biti prazno!";
            }
            else if (long.TryParse(imei.Text, out imei_out) == false)
            {
                poruka = "Niste uneli broj za polje IMEI!";
            }
            else if (model.Text.Trim().Equals("") || model.Text.Trim().Equals(string.Empty))
            {
                poruka = "Polje za model prototipa ne sme biti prazno!";
            }
            else if (memorija.Text.Trim().Equals("") || memorija.Text.Trim().Equals(string.Empty))
            {
                poruka = "Polje za memoriju prototipa ne sme biti prazno!";
            }
            else if (extsrc.Text.Trim().Equals("") || extsrc.Text.Trim().Equals(string.Empty))
            {
                poruka = "Polje za externi izvor prototipa ne sme biti prazno!";
            }
            else if (SelectedImage.Equals(""))
            {
                poruka = "Niste odabrali nijednu sliku za prototip!";
            }
            else
            {
                // nije doslo do greske, sve je okej
                return true;
            }

            MsgBox.Show(naslov, poruka, MsgBoxIcon.Error, MsgBoxIconColor.Error);
            return false;
        }

        private void GetDataFromForm(out long imei_l, out string model_s, out string memorija_s, out string extsrc_s)
        {
            // ako si polja okej, kreira se objekat
            string imei_s = imei.Text.Trim();
            long.TryParse(imei_s, out imei_l);
            model_s = model.Text.Trim();
            memorija_s = memorija.Text.Trim();
            extsrc_s = extsrc.Text.Trim();
        }

        private void SaveRtfToDisk(string rtf)
        {
            // save rtf file
            TextRange t = new TextRange(rtbEditor.Document.ContentStart, rtbEditor.Document.ContentEnd);
            FileStream file = new FileStream(rtf, FileMode.Create);
            t.Save(file, System.Windows.DataFormats.XamlPackage);
            file.Close();
        }

        private void LoadDataIntoRtb(string rTFPath)
        {
            TextRange t = new TextRange(rtbEditor.Document.ContentStart, rtbEditor.Document.ContentEnd);
            FileStream file = new FileStream(rTFPath, FileMode.Open);
            t.Load(file, System.Windows.DataFormats.XamlPackage);
            file.Close();
        }
        #endregion

        #region UI PREPARATIONS METHODS
        private void PrepareToolBar()
        {
            // grab system fonts
            cmbFontFamily.ItemsSource = Fonts.SystemFontFamilies.OrderBy(f => f.Source);

            // grab the font colors
            // The "Color" items will be extracted from the System.Windows.Media.Colors class.
            Type t = typeof(Colors);

            cboColors.ItemsSource = t.GetProperties();
            // Set the default color to Black.
            cboColors.SelectedItem = t.GetProperty("Black");

            // set combobox font size increment by 2
            for (int i = 2; i <= 32; i += 2)
            {
                cmbFontSize.Items.Add(i);
            }

            // also add "big" fonts
            cmbFontSize.Items.Add(40);
            cmbFontSize.Items.Add(50);
            cmbFontSize.Items.Add(60);
            cmbFontSize.Items.Add(80);

            cmbFontSize.SelectedIndex = 5; // default font
        }

        private void PrepareForm(string mode, MobileDevice current)
        {
            // change look of window depending on logged in user
            if (mode.Equals(EditModes.Add))
            {
                // hide edit button
                IzmeniBtn.Visibility = Visibility.Hidden;
            }
            else if (mode.Equals(EditModes.Edit))
            {
                DodajBtn.Visibility = Visibility.Hidden;

                // disable key edit -> IMEI field
                imei.IsReadOnly = true;
                SelectedImage = current.ImagePathAssembly;

                IzmeniBtn.Margin = new Thickness(50, 10, 10, 10);
                ExitBtn.Content = "  PONIŠTAVANJE IZMENA " + MsgBoxIcon.Error + "  ";

                // save current imei for later editing
                CurrentImei = current.IMEI;
                CurrentRtfPath = current.RtfPathAssembly;

                FillUpDataFromObject(current);
            }
            else
            {
                // lock out all fields for edit
                imei.IsEnabled = false;
                model.IsEnabled = false;
                memorija.IsEnabled = false;
                extsrc.IsEnabled = false;
                rtbEditor.IsReadOnly = true;
                SlikaBtn.IsEnabled = false;

                // hide toolbar too
                MainToolbar.Visibility = Visibility.Hidden;

                // hide buttons for add and edit
                DodajBtn.Visibility = Visibility.Hidden;
                IzmeniBtn.Visibility = Visibility.Hidden;
                SlikaBtn.Visibility = Visibility.Hidden;
                ExitBtn.Content = "  ODUSTANAK " + MsgBoxIcon.Error + "  ";

                // use more columns and space for image in view mode
                panel.Visibility = Visibility.Hidden;
                border.Visibility = Visibility.Visible;
                SlikaPregled.Source = new BitmapImage(new Uri(current.ImagePathAssembly, UriKind.Absolute));

                // fill up data from object
                FillUpDataFromObject(current);

            }
        }

        private void ClearFields()
        {
            imei.Clear();
            model.Clear();
            memorija.Clear();
            extsrc.Clear();
            rtbEditor.Document.Blocks.Clear();
            slika.Source = new BitmapImage(new Uri("/../../resources/placeholder.png", UriKind.Relative));
        }

        private void FillUpDataFromObject(MobileDevice current)
        {
            // fill up fields with current data from object
            if (current != null)
            {
                // fill up fields
                imei.Text = current.IMEI.ToString();
                model.Text = current.Model;
                memorija.Text = current.Memory;
                extsrc.Text = current.ExternalSource;
                LoadDataIntoRtb(current.RtfPathAssembly);
                slika.Source = new BitmapImage(new Uri(current.ImagePathAssembly, UriKind.Absolute));
                CurrentImage = current.ImagePathAssembly;
            }
        }
        #endregion

        #region RICH TEXT BOX METHODS
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

            if (rtb != null && rtb.Selection is TextSelection && !Mode.Equals(EditModes.Preview))
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
        #endregion

        #region MULTIMEDIA SUPPORTED METHODS
        private void MediaElement_MediaEnded(object sender, RoutedEventArgs e)
        {
            mediaElement.Position = new TimeSpan(0, 0, 1);
            mediaElement.Play();
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
                slika.Source = new BitmapImage(new Uri("/../../resources/placeholder.png", UriKind.Relative));
            }
        }
        #endregion
    }
}
