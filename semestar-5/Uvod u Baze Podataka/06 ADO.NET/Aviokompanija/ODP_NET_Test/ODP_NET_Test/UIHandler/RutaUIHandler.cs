using ODP_NET_example_template.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_Test.UIHandler
{
    public class RutaUIHandler
    {
        private static readonly RutaService rutaService = new RutaService();

        public void HandleMenu()
        {
            string answer;
            do
            {
                Console.WriteLine();
                Console.WriteLine("Odaberite funkcionalnost:");
                Console.WriteLine("1  - Prikaz svih");
                Console.WriteLine("2  - Prikaz po identifikatoru");
                Console.WriteLine("3  - Unos jednog");
                Console.WriteLine("4  - Izmena po identifikatoru");
                Console.WriteLine("5  - Brisanje po identifikatoru");
                Console.WriteLine("X  - Povratak u prethodni meni");

                answer = Console.ReadLine();

                switch (answer)
                {
                    case "1":
                        ShowAll();
                        break;
                    case "2":
                        ShowById();
                        break;
                    case "3":
                        HandleSingleInsert();
                        break;
                    case "4":
                        HandleUpdate();
                        break;
                    case "5":
                        HandleDelete();
                        break;
                }

            } while (!answer.ToUpper().Equals("X"));
        }

        private void ShowAll()
        {

        }

        private void ShowById()
        {

        }

        private void HandleSingleInsert()
        {

        }

        private void HandleUpdate()
        {

        }

        private void HandleDelete()
        {

        }
    }
}
