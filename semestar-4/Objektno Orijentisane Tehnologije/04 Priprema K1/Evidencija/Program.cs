using System;

namespace Evidencija
{
    class Program
    {
        static void Main(string[] args)
        {
            Zaposleni z1 = new Zaposleni(14, "/", "/", 100, 10, 5);
            Console.WriteLine(z1);

            EvidencijaZaposlenih evidencijaZaposlenih = new EvidencijaZaposlenih("FTN", "Trg Dositeja Obradovica 6");
            evidencijaZaposlenih.UcitajZaposlene("Zaposleni.txt");
            Console.WriteLine(evidencijaZaposlenih);

            Zaposleni best = evidencijaZaposlenih.NajboljiRadnik();
            if(best != null)
                Console.WriteLine("Radnik sa najvecom platom: " + best.Id + ". " + best.Ime + " " + best.Prezime + " " + evidencijaZaposlenih.Plata(best.Id) + " RSD");
            else
                Console.WriteLine("Lista je prazna!");
        }
    }
}
