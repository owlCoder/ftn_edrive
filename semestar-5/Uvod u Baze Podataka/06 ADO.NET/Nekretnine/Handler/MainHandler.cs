using Nekretnine.DTO;
using Nekretnine.Model;
using Nekretnine.Service;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nekretnine.UIHandler
{
    public class MainHandler
    {
        private static readonly LiceService liceService = new LiceService();
        private static readonly ObjekatService objekatService = new ObjekatService();
        public void HandleMainMenu()
        {
            string answer;
            do
            {
                Console.WriteLine();
                Console.WriteLine("Odaberite opciju:");
                Console.WriteLine("1 - Prikaz svih lica");
                Console.WriteLine("2 - Prebrojavanje lica");
                Console.WriteLine("3 - Da li postoji lice sa zadatim ID");
                Console.WriteLine("4 - Prikaz vrste objekta po IDVO i ukupne vrednosti");
                Console.WriteLine("5 - II NACIN: Prikaz vrste objekta po IDVO i ukupne vrednosti");
                Console.WriteLine("X - Izlazak iz programa");

                answer = Console.ReadLine();
                Console.WriteLine();

                switch (answer)
                {
                    case "1":
                        PrikazSvih();
                        break;
                    case "2":
                        Prebroj();
                        break;
                    case "3":
                        PostojiLi();
                        break;
                    case "4":
                        ObjektiPoIdvoSuma();
                        break;
                    case "5":
                        Objekti2Nacin();
                        break;
                }

            } while (!answer.ToUpper().Equals("X"));
        }

        private void Objekti2Nacin()
        {
            try
            {
                Console.Write("Unesite IDVO objekta: ");
                int idvo = Int32.Parse(Console.ReadLine());

                // vise ne ide lista nego DTO
                TipObjektaUkupnaVrednostDTO objektiVrednost = objekatService.UkupnaVrednostObjekti(idvo);
                
                // sada treba u dto da pristupi polju koja je lista objekata
                if (objektiVrednost.Objekti.Count == 0)
                {
                    Console.WriteLine("\n============================ NEMA OBJEKATA PO TRAZENOM IDVO ===========================");
                    return;
                }
                Console.WriteLine();
                Console.WriteLine(Objekat.GetFormattedHeader());
                Console.WriteLine("=====================================================================");

                foreach (Objekat trenutni in objektiVrednost.Objekti) // isto vazi i ovde
                {
                    Console.WriteLine(trenutni);
                }

                double vrednost = objektiVrednost.UkupnaVrednost / 118; // polje u DTO nam sada sadrzi vrednost 
                // ne treba nam vise posebna metoda
                Console.WriteLine("----------------------------------------------------------------------");
                Console.WriteLine("Ukupna vrednost objekta IDVO tipa {0} je: {1}\n", idvo, Math.Round(vrednost, 2));

            }
            catch (DbException e)
            {
                Console.WriteLine(e.Message);
            }
        }

        private void PrikazSvih()
        {
            try
            {
                List<Lice> lica = liceService.FindAll().ToList();

                Console.WriteLine(Lice.GetFormattedHeader());
                Console.WriteLine("===================================================================");

                foreach(Lice l in lica) 
                {
                    Console.WriteLine(l);
                }
            }
            catch (DbException e)
            {
                Console.WriteLine(e.Message);
            }
        }

        private void Prebroj()
        {
            try
            {
                int brojLica = liceService.Count();
                Console.WriteLine("\n==================== BROJ LICA: {0} ====================\n", brojLica);
            }
            catch (DbException e)
            {
                Console.WriteLine(e.Message);
            }

        }

        private void PostojiLi()
        {
            try
            {
                Console.WriteLine("Unesite ID Lica: ");
                string id = Console.ReadLine();

                bool postoji = liceService.ExistsById(id);

                if(postoji)
                {
                    Console.WriteLine("\nPostoji Lice sa ID-jem {0}", id);
                }
                else
                {
                    Console.WriteLine("\nNe postoji Lice sa ID-jem {0}", id);
                }
            }
            catch(DbException e)
            {
                Console.WriteLine(e.Message);
            }
        }

        private void ObjektiPoIdvoSuma()
        {
            try
            {
                Console.Write("Unesite IDVO objekta: ");
                int idvo = Int32.Parse(Console.ReadLine());

                List<Objekat> objekti = objekatService.PronadjiObjekteZaIdvo(idvo);

                if (objekti.Count == 0)
                {
                    Console.WriteLine("\n============================ NEMA OBJEKATA PO TRAZENOM IDVO ===========================");
                    return;
                }
                Console.WriteLine();
                Console.WriteLine(Objekat.GetFormattedHeader());
                Console.WriteLine("=====================================================================");

                foreach(Objekat trenutni in objekti) 
                {
                    Console.WriteLine(trenutni);
                }

                double vrednost = objekatService.UkupnaVrednostObjektaIdvo(idvo) / 118; // vrednost u evrima
                Console.WriteLine("----------------------------------------------------------------------");
                Console.WriteLine("Ukupna vrednost objekta IDVO tipa {0} je: {1}\n", idvo, Math.Round(vrednost, 2));

            }
            catch (DbException e)
            {
                Console.WriteLine(e.Message);
            }
        }
    }
}
