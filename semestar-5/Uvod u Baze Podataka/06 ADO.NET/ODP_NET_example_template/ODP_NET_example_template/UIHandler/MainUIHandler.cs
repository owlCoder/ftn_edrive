using System;

namespace ODP_NET_example_template.UIHandler
{
    public class MainUIHandler
    {
        private readonly RadnikUIHandler radnikUIHandler = new RadnikUIHandler();
        private readonly ProjekatUIHandler projekatUIHandler = new ProjekatUIHandler();
        private readonly RadprojUIHandler radprojUIHandler = new RadprojUIHandler();
        private readonly ComplexQueryUIHandler complexQueryUIHandler = new ComplexQueryUIHandler();

        public void HandleMainMenu()
        {
            string answer;
            do
            {
                Console.WriteLine();
                Console.WriteLine("Odaberite opciju:");
                Console.WriteLine("1 - Rukovanje radnicima");
                Console.WriteLine("2 - Rukovanje projektima");
                Console.WriteLine("3 - Rukovanje angazovanjem");
                Console.WriteLine("5 - Kompleksni upiti");
                Console.WriteLine("X - Izlazak iz programa");

                answer = Console.ReadLine();

                switch (answer)
                {
                    case "1":
                        radnikUIHandler.HandleMenu();
                        break;
                    case "2":
                        projekatUIHandler.HandleMenu();
                        break;
                    case "3":
                        radprojUIHandler.HandleMenu();
                        break;
                    case "5":
                        complexQueryUIHandler.HandleComplexQueryMenu();
                        break;
                }

            } while (!answer.ToUpper().Equals("X"));
        }
    }
}
