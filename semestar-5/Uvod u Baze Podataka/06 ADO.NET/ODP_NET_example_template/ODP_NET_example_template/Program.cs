using ODP_NET_example_template.UIHandler;

//TODO: uneti broj indeksa, ime i prezime
//

namespace ODP_NET_example_template
{
    class Program
    {

        private static readonly MainUIHandler mainUIHandler = new MainUIHandler();

        static void Main(string[] args)
        {
            mainUIHandler.HandleMainMenu();
        }
    }
}
