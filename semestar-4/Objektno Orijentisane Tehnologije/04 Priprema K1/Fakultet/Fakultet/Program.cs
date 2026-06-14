using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fakultet
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Predmet p1 = new Predmet();
            Predmet p2 = new Predmet("Operativni","ESI200",10);

            Console.WriteLine(p1);
            Console.WriteLine(p2);

            Knjizica k = new Knjizica("Milica Pantelic");
            Console.WriteLine(k);

            k.LoadFromFile("predmeti.txt");
            k.Sortiraj();
            Console.WriteLine(k);
            Console.WriteLine("PROSEK: " + k.RacunajProsek());
            k.Brisanje(2);
            k.SaveToFile("sortirano.txt");
        }
    }
}
