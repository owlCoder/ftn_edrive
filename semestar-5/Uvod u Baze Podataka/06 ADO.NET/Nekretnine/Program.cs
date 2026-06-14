using Nekretnine.UIHandler;
using System.Runtime.CompilerServices;

namespace Nekretnine
{
    public class Program
    {
        private static readonly MainHandler liceHandler = new MainHandler();
        static void Main(string[] args)
        {
            liceHandler.HandleMainMenu();
        }
    }
}
