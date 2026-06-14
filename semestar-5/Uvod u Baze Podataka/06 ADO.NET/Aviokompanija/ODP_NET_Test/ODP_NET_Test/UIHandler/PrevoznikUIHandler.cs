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
    public class PrevoznikUIHandler
    {
        private static readonly PrevoznikService prevoznikService = new PrevoznikService();

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
            Console.WriteLine(Prevoznik.GetFormattedHeader());
            try
            {
                foreach (Prevoznik v in prevoznikService.FindAll())
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
            Console.WriteLine(Prevoznik.GetFormattedHeader());
            try
            {
                Console.WriteLine("Unesite idp: ");
                string id = Console.ReadLine();

                Console.WriteLine(prevoznikService.GetById(id));
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
                Console.WriteLine("Unesite idp: ");
                string id = Console.ReadLine();

                Console.WriteLine("Unesite nazivp: ");
                string n = Console.ReadLine();

                Console.WriteLine("Unesite gradp: ");
                string g = Console.ReadLine();

                Console.WriteLine("Unesite broj flote p: ");
                int b = Int32.Parse(Console.ReadLine());

                prevoznikService.Save(new Prevoznik(id, n, g, b));
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
                Console.WriteLine("Unesite idp: ");
                string id = Console.ReadLine();

                Console.WriteLine("Unesite nazivp: ");
                string n = Console.ReadLine();

                Console.WriteLine("Unesite gradp: ");
                string g = Console.ReadLine();

                Console.WriteLine("Unesite broj flote p: ");
                int b = Int32.Parse(Console.ReadLine());

                prevoznikService.Save(new Prevoznik(id, n, g, b));
            }
            catch (DbException e)
            {
                Console.WriteLine(e.Message);
            }
        }

        private void HandleDelete()
        {
            try
            {
                Console.WriteLine("Unesite idp: ");
                string id = Console.ReadLine();

                prevoznikService.DeleteById(id);
            }
            catch (DbException e)
            {
                Console.WriteLine(e.Message);
            }
        }

    }
}
