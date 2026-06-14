using System;

namespace ODP_NET_example_template.UIHandler
{
    public class ComplexQueryUIHandler
    {

        // TODO uncomment
        // private static readonly RadnikService radnikService = new RadnikService();
        // private static readonly ProjekatService projekatService = new ProjekatService();
        // private static readonly RadprojService radprojService = new RadprojService();

        public void HandleComplexQueryMenu()
        {
            string answer;
            do
            {
                Console.WriteLine();
                Console.WriteLine("Odaberite funkcionalnost:");
                Console.WriteLine("1  - ");
                Console.WriteLine("2  - ");
                Console.WriteLine("3  - ");
                Console.WriteLine("X  - Izlazak iz kompleksnih upita");

                answer = Console.ReadLine();

                switch (answer)
                {
                    case "1":
                        //TODO:
                        break;
                    case "2":
                        //TODO:
                        break;
                    case "3":
                        //TODO:
                        break;
                }

            } while (!answer.ToUpper().Equals("X"));
        }

    }
}
