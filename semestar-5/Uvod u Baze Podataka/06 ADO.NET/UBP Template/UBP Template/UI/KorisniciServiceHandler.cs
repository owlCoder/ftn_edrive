using System;
using System.Data.Common;
using UBP_Template.Models;
using UBP_Template.Services;

namespace UBP_Template.UI
{
    public class KorisniciServiceHandler
    {
        private static readonly KorisniciService servisKorisnici = new KorisniciService();

        public void MeniKorisnici()
        {
            string unosKorisnika;

            do
            {
                Console.WriteLine("Odaberite opciju za rad sa tabelom Korisnici");
                Console.WriteLine("1 - Prikaz svih korisnika");
                Console.WriteLine("2 - Prikaz korisnika sa odredjenim ID");
                Console.WriteLine("0 - Izlaz");

                Console.Write("\nVas izbor\n>> ");
                unosKorisnika = Console.ReadLine();

                switch (unosKorisnika)
                {
                    case "1":
                        PrikazSvih();
                        break;
                    case "2":
                        PrikazPoId();
                        break;
                }

                Console.WriteLine("\n");
            } while (!unosKorisnika.Equals("0"));

            Console.WriteLine("\n");
        }
        private void PrikazSvih()
        {
            Console.WriteLine("\n----------------------------------------------------------------------");
            Console.WriteLine(Korisnik.GetFormatedHeader());
            Console.WriteLine("----------------------------------------------------------------------");

            try
            {
                foreach (Korisnik korisnik in servisKorisnici.GetAllKorisnici())
                {
                    Console.WriteLine(korisnik);
                    Console.WriteLine("----------------------------------------------------------------------");
                }
            }
            catch (DbException e)
            {
                Console.WriteLine(e.Message);
            }
        }
        private void PrikazPoId()
        {
            int id = -1;

            do
            {
                Console.Write("\nUnesite id korisnika koji trazite\n>> ");
                id = Int32.Parse(Console.ReadLine());
            } while (id < 1);

            Korisnik trazeni = servisKorisnici.GetExactKorisnici(id);

            if (trazeni == null)
            {
                Console.WriteLine("\n\n------------ Korisnik sa ID: {0} ne postoji u bazi podataka! -------------", id);
            }
            else
            {
                Console.WriteLine("\n----------------------------------------------------------------------");
                Console.WriteLine(Korisnik.GetFormatedHeader());
                Console.WriteLine("----------------------------------------------------------------------");
                Console.WriteLine(trazeni);
                Console.WriteLine("----------------------------------------------------------------------");
            }
        }


    }
}
