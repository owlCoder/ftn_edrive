using ODP_NET_example_template.DTO;
using ODP_NET_example_template.Model;
using ODP_NET_example_template.Services;
using System;
using System.Collections.Generic;

namespace ODP_NET_example_template.UIHandler
{
    public class RadnikUIHandler
    {
        // TODO uncomment
         private static readonly RadnikService radnikService = new RadnikService();

        public void HandleMenu()
        {
            string answer;
            do
            {
                Console.WriteLine();
                Console.WriteLine("Odaberite funkcionalnost:");
                Console.WriteLine("1  - Prikaz svih");
                Console.WriteLine("2  - Prikaz po identifikatoru");
                Console.WriteLine("10  - Prikaz projekata po radniku");
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
                    case "10":
                        RadBrProj();
                        break;
                }

            } while (!answer.ToUpper().Equals("X"));
        }

        private void RadBrProj()
        {
            List<RadnikDTO> lista = radnikService.RadniciBrojProjekata();

            foreach(RadnikDTO dto in lista)
            {
                Console.WriteLine(dto.ToString());
            }
        }

        private void ShowAll()
        {
            List<Radnik> radnici = radnikService.FindAll();

            Console.WriteLine(Model.Radnik.GetFormattedHeader());
            foreach(Radnik radnik in radnici)
            {
                Console.WriteLine(radnik);
            }
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
