using ODP_NET_example_template.Model;
using ODP_NET_example_template.Service;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_Test.UIHandler
{
    public class VlasnikUIHandler
    {
        private static readonly VlasnikService vlasnikService = new VlasnikService();

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
            Console.WriteLine(Vlasnik.GetFormattedHeader());
            try
            {
                foreach (Vlasnik v in vlasnikService.FindAll())
                {
                    Console.WriteLine(v);
                }
            }
            catch (DbException e)
            {
                Console.WriteLine(e.Message);
            }
        }

        private void ShowById()
        {
            Console.WriteLine(Vlasnik.GetFormattedHeader());
            try
            {
                Console.WriteLine("Unesite idv: ");
                string id = Console.ReadLine();

                Console.WriteLine(vlasnikService.GetById(id));
            }
            catch (DbException e)
            {
                Console.WriteLine(e.Message);
            }
        }

        private void HandleSingleInsert()
        {
            try
            {
                Console.WriteLine("Unesite idv: ");
                string id = Console.ReadLine();

                Console.WriteLine("Unesite imev: ");
                string ime = Console.ReadLine();

                Console.WriteLine("Unesite przv: ");
                string przv = Console.ReadLine();

                Console.WriteLine("Unesite vrstav: ");
                string vrsta = Console.ReadLine();

                vlasnikService.Save(new Vlasnik(id, ime, przv, vrsta));
            }
            catch (DbException e)
            {
                Console.WriteLine(e.Message);
            }
        }

        private void HandleUpdate()
        {
            try
            {
                Console.WriteLine("Unesite idv: ");
                string id = Console.ReadLine();

                Console.WriteLine("Unesite imev: ");
                string ime = Console.ReadLine();

                Console.WriteLine("Unesite przv: ");
                string przv = Console.ReadLine();

                Console.WriteLine("Unesite vrstav: ");
                string vrsta = Console.ReadLine();

                vlasnikService.Save(new Vlasnik(id, ime, przv, vrsta));
            }
            catch (DbException e)
            {
                Console.WriteLine(e.Message);
            }
        }

        private void HandleDelete()
        {
            Console.WriteLine(Vlasnik.GetFormattedHeader());
            try
            {
                Console.WriteLine("Unesite idv: ");
                string id = Console.ReadLine();

                vlasnikService.DeleteById(id);
            }
            catch (DbException e)
            {
                Console.WriteLine(e.Message);
            }
        }

    }
}
