using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Reflection;
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
using Brush = System.Windows.Media.Brush;
using Brushes = System.Windows.Media.Brushes;

namespace TextEditor
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private bool whiteBackground;

        private ImageBrush img1;
        private ImageBrush img2;

        private Brush defaultToolbarColor;

        public MainWindow()
        {
            InitializeComponent();

            whiteBackground = true;
            defaultToolbarColor = MainToolbar.Background;

            img1 = new ImageBrush();
            img1.ImageSource = new BitmapImage(new Uri("..\\..\\bgimg1.png", UriKind.Relative));

            img2 = new ImageBrush();
            img2.ImageSource = new BitmapImage(new Uri("..\\..\\bgimg2.png", UriKind.Relative));

            cmbFontFamily.ItemsSource = Fonts.SystemFontFamilies.OrderBy(f => f.Source);
        }

        private void rtbEditor_SelectionChanged(object sender, RoutedEventArgs e)
        {
            object temp = rtbEditor.Selection.GetPropertyValue(Inline.FontWeightProperty);
            btnBold.IsChecked = (temp != DependencyProperty.UnsetValue) && (temp.Equals(FontWeights.Bold));

            temp = rtbEditor.Selection.GetPropertyValue(Inline.FontFamilyProperty);
            cmbFontFamily.SelectedItem = temp;
        }
        private void cmbFontFamily_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (cmbFontFamily.SelectedItem != null && !rtbEditor.Selection.IsEmpty)
            {
                rtbEditor.Selection.ApplyPropertyValue(Inline.FontFamilyProperty, cmbFontFamily.SelectedItem);
            }
        }
        private void Window_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }

        private void CloseButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void ChangeBackground_Click(object sender, RoutedEventArgs e)
        {
            if (whiteBackground == true)
            {
                whiteBackground = false;
                UIPath.Fill = img2;
                ChangeBackground.Background = Brushes.DarkGray;
                ChangeBackground.Foreground = Brushes.White;
                MainToolbar.Background = Brushes.DarkGray;

            }
            else
            {
                whiteBackground = true;
                UIPath.Fill = img1;
                ChangeBackground.Background = Brushes.White;
                ChangeBackground.Foreground = Brushes.Black;
                MainToolbar.Background = defaultToolbarColor;
            }
        }
    }
}
