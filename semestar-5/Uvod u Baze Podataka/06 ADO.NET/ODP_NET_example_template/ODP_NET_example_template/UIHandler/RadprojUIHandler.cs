using System;

namespace ODP_NET_example_template.UIHandler
{
    public class RadprojUIHandler
    {
        // TODO uncomment
        // private static readonly RadprojService radprojService = new RadprojService();

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
                Console.WriteLine("4  - Unos vise");
                Console.WriteLine("5  - Izmena po identifikatoru");
                Console.WriteLine("6  - Brisanje po identifikatoru");
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
                        HandleMultipleInserts();
                        break;
                    case "5":
                        HandleUpdate();
                        break;
                    case "6":
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

        private void HandleMultipleInserts()
        {

        }
    }
}
