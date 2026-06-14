using ODP_NET_example_template.DTO;
using ODP_NET_example_template.Model;
using ODP_NET_example_template.Service;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_Test.UIHandler
{
    public class ComplexQueryUIHandler
    {

        private static readonly AerodromService aerodromService = new AerodromService();
        private static readonly GradService gradService = new GradService();
        private static readonly PrevoznikService prevoznikService = new PrevoznikService();
        private static readonly RutaService rutaService = new RutaService();

        public void HandleComplexQueryMenu()
        {
            string answer;
            do
            {
                Console.WriteLine();
                Console.WriteLine("Odaberite funkcionalnost:");
                Console.WriteLine("1  - Lak izvestaj");
                Console.WriteLine("2  - Kompleksan izvestaj");
                Console.WriteLine("3  - Transakcija");
                Console.WriteLine("X  - Izlazak iz kompleksnih upita");

                answer = Console.ReadLine();

                switch (answer)
                {
                    case "1":
                        LakIzvestaj();
                        break;
                    case "2":
                        KompleksanIzvestaj();
                        break; 
                    case "3":
                        Transakcija();
                        break;                    
                }

            } while (!answer.ToUpper().Equals("X"));
        }

        private void Transakcija()
        {
            try
            {
                Console.WriteLine("Unesite id prevoznika: ");
                string idp = Console.ReadLine();

                Console.WriteLine("Unesite id aerodroma: ");
                string ida = Console.ReadLine();

                aerodromService.Transakcija(idp, ida);
            }
            catch (DbException ex) 
            {
                Console.WriteLine(ex.Message);
            }
        }

        private void KompleksanIzvestaj()
        {
            try
            {
                List<KompleksDTO> list = aerodromService.KompleksanIzvestaj();

                foreach(KompleksDTO kd in list)
                {
                    Console.WriteLine(Aerodrom.GetFormattedHeader());
                    Console.WriteLine(kd.Aerodrom);
                    Console.WriteLine("\nPolazaka: {0}, Dolazaka: {1}", kd.Polazaka, kd.Dolazaka);
                    
                    foreach(RutaDto rt in kd.RutaDtoL)
                    {
                        Console.WriteLine(rt);
                    }
                    Console.WriteLine("\n");
                }
            }
            catch(DbException db)
            {
                Console.WriteLine(db.Message);
            }
        }

        private void LakIzvestaj()
        {
            try
            {
                Console.Write("Unesite naziv aerodroma: ");
                string naziva = Console.ReadLine();

                List<Ruta> find = aerodromService.LakIzvestaj(naziva);

                Console.WriteLine(Ruta.GetFormattedHeader());
                foreach (Ruta v in find)
                {
                    Console.WriteLine(v);
                }
            }
            catch (DbException e)
            {
                Console.WriteLine(e.Message);
            }
        }
    }
}
