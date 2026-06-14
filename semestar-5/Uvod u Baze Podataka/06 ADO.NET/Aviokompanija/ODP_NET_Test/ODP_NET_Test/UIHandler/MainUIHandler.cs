using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_Test.UIHandler
{
    public class MainUIHandler
    {
        private readonly GradUIHandler gradUIHandler = new GradUIHandler();
        private readonly AerodromUIHandler aerodromUIHandler = new AerodromUIHandler();
        private readonly PrevoznikUIHandler prevoznikUIHandler = new PrevoznikUIHandler();
        private readonly RutaUIHandler rutaUIHandler = new RutaUIHandler();
        private readonly ComplexQueryUIHandler complexQueryUIHandler = new ComplexQueryUIHandler();

        public void HandleMainMenu()
        {
            string answer;
            do
            {
                Console.WriteLine();
                Console.WriteLine("Odaberite opciju:");
                Console.WriteLine("1 - Rukovanje gradovima");
                Console.WriteLine("2 - Rukovanje aerodromima");
                Console.WriteLine("3 - Rukovanje prevoznicima");
                Console.WriteLine("3 - Rukovanje rutama");
                Console.WriteLine("5 - Kompleksni upiti");
                Console.WriteLine("X - Izlazak iz programa");

                answer = Console.ReadLine();

                switch (answer)
                {
                    case "1":
                        gradUIHandler.HandleMenu();
                        break;
                    case "2":
                        aerodromUIHandler.HandleMenu();
                        break;
                    case "3":
                        prevoznikUIHandler.HandleMenu();
                        break;
                    case "4":
                        rutaUIHandler.HandleMenu();
                        break;
                    case "5":
                        complexQueryUIHandler.HandleComplexQueryMenu();
                        break;
                }

            } while (!answer.ToUpper().Equals("X"));
        }
    }
}
