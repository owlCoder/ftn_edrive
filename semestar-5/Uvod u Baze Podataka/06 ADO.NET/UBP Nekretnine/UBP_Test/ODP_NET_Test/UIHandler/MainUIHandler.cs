using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_Test.UIHandler
{
    public class MainUIHandler
    {
        private readonly VrstaNekUIHandler vrstaNekUIHandler = new VrstaNekUIHandler();
        private readonly VlasnikUIHandler vlasnikUIHandler = new VlasnikUIHandler();
        private readonly NekretninaUIHandler nekretninaUIHandler = new NekretninaUIHandler();
        private readonly PoreskaKarticaUIHandler poreskaKarticaUIHandler = new PoreskaKarticaUIHandler();
        private readonly ComplexQueryUIHandler complexQueryUIHandler = new ComplexQueryUIHandler();

        public void HandleMainMenu()
        {
            string answer;
            do
            {
                Console.WriteLine();
                Console.WriteLine("Odaberite opciju:");
                Console.WriteLine("1 - Rukovanje vrstama nekretnina");
                Console.WriteLine("2 - Rukovanje vlasnicima");
                Console.WriteLine("3 - Rukovanje nekretninama");
                Console.WriteLine("3 - Rukovanje poreskim karticama");
                Console.WriteLine("5 - Kompleksni upiti");
                Console.WriteLine("X - Izlazak iz programa");

                answer = Console.ReadLine();

                switch (answer)
                {
                    case "1":
                        vrstaNekUIHandler.HandleMenu();
                        break;
                    case "2":
                        vlasnikUIHandler.HandleMenu();
                        break;
                    case "3":
                        nekretninaUIHandler.HandleMenu();
                        break;
                    case "4":
                        poreskaKarticaUIHandler.HandleMenu();
                        break;
                    case "5":
                        complexQueryUIHandler.HandleComplexQueryMenu();
                        break;
                }

            } while (!answer.ToUpper().Equals("X"));
        }
    }
}
