using System;

namespace Zadatak_2
{
    class Program
    {
        static void Main(string[] args)
        {
            TekuciRacun tekuciRacun = new TekuciRacun(10000.0);
            DevizniRacun devizniRacun = new DevizniRacun(50.0);

            Console.WriteLine(tekuciRacun);
            Console.WriteLine(devizniRacun);

            // tekuci racun
            if (tekuciRacun.Uplata(100.52))
                Console.WriteLine("Uplata uspesna!");
            else
                Console.WriteLine("Uplata neuspesna!");

            Console.WriteLine(tekuciRacun);

            if (tekuciRacun.Isplata(100.52))
                Console.WriteLine("Isplata uspesna!");
            else
                Console.WriteLine("Isplata neuspesna!");
            
            Console.WriteLine(tekuciRacun);

            // devizni racun
            if (devizniRacun.Uplata(10.52))
                Console.WriteLine("Uplata uspesna!");
            else
                Console.WriteLine("Uplata neuspesna!");

            Console.WriteLine(devizniRacun);

            if (devizniRacun.Isplata(100.52))
                Console.WriteLine("Uplata uspesna!");
            else
                Console.WriteLine("Uplata neuspesna!");

            Console.WriteLine(devizniRacun);

            Console.WriteLine("\n-------------------- KONACNO STANJE ---------------------");
            Console.WriteLine(tekuciRacun);
            Console.WriteLine(devizniRacun);

            Console.ReadLine();
        }
    }
}
