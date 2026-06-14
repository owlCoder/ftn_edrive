using System.Windows.Media;

namespace Common.Constants
{
    public class MsgBoxIconColor
    {
        public static readonly SolidColorBrush Information = (SolidColorBrush)new BrushConverter().ConvertFrom("#00a5ff");
        public static readonly SolidColorBrush Warning = (SolidColorBrush)new BrushConverter().ConvertFrom("#FFCC00");
        public static readonly SolidColorBrush Error = Brushes.DarkRed;
        public static readonly SolidColorBrush Question = (SolidColorBrush)new BrushConverter().ConvertFrom("#00a5ff");
    }
}
