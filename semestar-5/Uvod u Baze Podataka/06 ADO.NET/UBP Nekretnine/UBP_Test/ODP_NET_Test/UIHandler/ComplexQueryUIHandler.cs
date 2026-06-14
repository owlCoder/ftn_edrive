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

        private static readonly VlasnikService vlasnikService = new VlasnikService();
        private static readonly VrstaNekService vrstaNekService = new VrstaNekService();
        private static readonly NekretninaService nekretninaService = new NekretninaService();
        private static readonly PoreskaKarticaService poreskaKarticaService = new PoreskaKarticaService();

        public void HandleComplexQueryMenu()
        {
            string answer;
            do
            {
                Console.WriteLine();
                Console.WriteLine("Odaberite funkcionalnost:");
                Console.WriteLine("1  - Nekretnine sa kvd vecom od unete");
                Console.WriteLine("2  - Kompleksan izvestaj");
                Console.WriteLine("3  - Transakcija");
                Console.WriteLine("X  - Izlazak iz kompleksnih upita");

                answer = Console.ReadLine();

                switch (answer)
                {
                    case "1":
                        LakiIzvestaj();
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

        private void KompleksanIzvestaj()
        {
            try
            {
                List<PomDto> pomDtos = vlasnikService.KompleksIzvestaj();

                foreach(PomDto pd in pomDtos)
                {
                    Console.WriteLine(Vlasnik.GetFormattedHeader());
                    Console.WriteLine(pd.Vlasnik);
                    Console.WriteLine("Broj nekr: {0}\nSaldo: {1}\n", pd.BrojNek, pd.Saldo);

                    Console.WriteLine(Nekretnina.GetFormattedHeader());
                    foreach(Nekretnina n in pd.Nekretnine)
                    {
                        Console.WriteLine(n);
                    }
                    Console.WriteLine();
                }
            }
            catch(DbException ex) 
            {
                Console.WriteLine(ex.Message);
            }
        }

        private void Transakcija()
        {
            try
            {
                Console.WriteLine("Unesite idn: ");
                int idn = Int32.Parse(Console.ReadLine());

                Console.WriteLine("Unesite brnek: ");
                int brnek = Int32.Parse(Console.ReadLine());

                nekretninaService.Transakcija(idn, brnek);
            }
            catch(DbException e)
            {
                Console.WriteLine(e.Message);
            }
        }

        private void LakiIzvestaj()
        {
            try
            {
                Console.WriteLine("Unesite kvd: ");
                float kvd = float.Parse(Console.ReadLine());

                List<Nekretnina> nekretninas = nekretninaService.KvdVecaOd(kvd);

                Console.WriteLine(Nekretnina.GetFormattedHeader());
                foreach(Nekretnina n in nekretninas)
                {
                    Console.WriteLine(n);
                }
            }
            catch(DbException e)
            {
                Console.WriteLine(e.Message);
            }
        }
    }
}
