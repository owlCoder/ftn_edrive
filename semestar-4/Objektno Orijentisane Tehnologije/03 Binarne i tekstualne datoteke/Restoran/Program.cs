using System;

namespace Restoran
{
    class Program
    {
        static void Main(string[] args)
        {
            Restoran r = new Restoran("Masinac", "Trg Dositeja Obradovica 6");
            r.Import("jelovnik.txt");

            Console.WriteLine(r);

            r.Sortiraj();
            Console.WriteLine("\n" + r);

            r.Export("out.txt");
        }
    }
}
