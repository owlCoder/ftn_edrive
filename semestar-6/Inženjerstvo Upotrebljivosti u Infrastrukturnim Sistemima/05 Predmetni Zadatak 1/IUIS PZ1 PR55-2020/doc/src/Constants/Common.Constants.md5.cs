////////////////////////////////////////////////////////////
// Content Managment System Open-Source API v2023.03.23  ///
// Author: owlCoder (https://github.com/owlCoder)        ///
////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////
////////////////////// CONSTANTS ///////////////////////////
////////////////////////////////////////////////////////////

namespace Common.Constants
{
    public class EditModes
    {
        public static readonly string Add = "Dodavanje";
        public static readonly string Edit = "Izmena";
        public static readonly string Preview = "Pregled";
    }

    public class MsgBoxIcon
    {
        public static readonly string Information = "ℹ️";
        public static readonly string Warning = "⚠️";
        public static readonly string Error = "❌";
        public static readonly string Question = "❔";
    }

    public class MsgBoxIconColor
    {
        public static readonly SolidColorBrush Information = (SolidColorBrush)new BrushConverter().ConvertFrom("#00a5ff");
        public static readonly SolidColorBrush Warning = (SolidColorBrush)new BrushConverter().ConvertFrom("#FFCC00");
        public static readonly SolidColorBrush Error = Brushes.DarkRed;
        public static readonly SolidColorBrush Question = (SolidColorBrush)new BrushConverter().ConvertFrom("#00a5ff");
    }

    public class Paths
    {
        public static readonly string PathPrefix = AppDomain.CurrentDomain.BaseDirectory + "/data/";
        public static readonly string RtfPath = PathPrefix + "rtf/";
        public static readonly string ImgPath = PathPrefix + "img/";
        public static readonly string DbsPath = PathPrefix + "db/";

        public static readonly string UsersPath = DbsPath + "Cms.Users.Generic.dll";
        public static readonly string DevicesPath = DbsPath + "Cms.Devices.Collection.dll";
    }

    public class ProgramInformation
    {
        public static readonly string BussinessName = "Content Management System";
        public static readonly string EngineVersion = "2023.03.17L";
        public static readonly string Copyright = "©️ 2023 Sva prava zadržana!";
    }

    public class WelcomeMessages
    {
        private static readonly string[] message = { "Hello, ", "Hi, ", "What's up, ", "Greetings, ", "Sup, ", "Hey, " };

        public static string Message()
        {
            return message[new Random().Next(0, 5)];
        }
    }
}


////////////////////////////////////////////////////////////
////////////////////// END OF CONSTANTS ////////////////////
////////////////////////////////////////////////////////////

// END OF API EXPOSED METHODS