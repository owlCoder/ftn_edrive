using Common.Constants;
using System.Windows;
using System.Windows.Media;

namespace UI.WPF_Dialogs.msgBox
{
    public partial class MsgBox : Window
    {
        public static bool DaPritisnuto = false;
        public MsgBox(string title, string message, string ico, SolidColorBrush color)
        {
            InitializeComponent();

            this.title.Content = title;
            text.Text = message;
            DaPritisnuto = false;
            icon.Content = ico;
            icon.Foreground = color;

            if (!ico.Equals(MsgBoxIcon.Question))
            {
                // hide yes button and cancel button will be ok button
                DaBtn.Visibility = Visibility.Hidden;
                NeBtn.Content = "U REDU";

                object resource = Application.Current.FindResource("NeonDugmeOk");

                if (resource != null && resource.GetType() == typeof(Style))
                    NeBtn.Style = (Style)resource;
            }
        }

        public static void Show(string title, string message, string icon, SolidColorBrush icon_color)
        {
            MsgBox msgBoxInfo = new MsgBox(title, message, icon, icon_color);
            DaPritisnuto = false;
            msgBoxInfo.Title = title;
            msgBoxInfo.ShowDialog();
        }

        private void DaBtn_Click(object sender, RoutedEventArgs e)
        {
            DaPritisnuto = true;
            Close();
        }

        private void NeBtn_Click(object sender, RoutedEventArgs e)
        {
            DaPritisnuto = false;
            Close();
        }
    }
}
