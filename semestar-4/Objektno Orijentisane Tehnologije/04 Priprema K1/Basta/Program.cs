using System;

namespace Basta
{
    class Program
    {
        static void Main(string[] args)
        {
            // KLASA RUZA
            Ruza r1 = new Ruza();
            Ruza r2 = new Ruza("Nocna ruza", "Huolda", 9, false);

            Console.WriteLine(r1);
            Console.WriteLine(r2);

            // METODA ZALIVANJE
            if(r2.Zalivanje())
                Console.WriteLine("Ruza je zalivena!".ToUpper());
            else
                Console.WriteLine("Ruza nije zalivena!\n".ToUpper());

            // NECE SE ZALITI VEC ZALIVENA RUZA
            if (r2.Zalivanje())
                Console.WriteLine("Ruza je zalivena!".ToUpper());
            else
                Console.WriteLine("Ruza nije zalivena!\n".ToUpper());

            // KLASA HRIZANtEMA
            Hrizantema h1 = new Hrizantema();
            Hrizantema h2 = new Hrizantema("Dnevna Hrizantema", "Zbun", 42, false, 14, "Plava", 24);
            Hrizantema h3 = new Hrizantema();

            Console.WriteLine(h1.ToString() +"\n" + h2.ToString() + "\n" + h3.ToString());
 
            // METODA EQUALS
            if(h1.Equals(h2))
                Console.WriteLine("HRIZANTEME SU ISTE!");
            else
                Console.WriteLine("HRIZANTEME NISU ISTE!");

            // METODA EQUALS
            if (h1.Equals(h3))
                Console.WriteLine("HRIZANTEME SU ISTE!");
            else
                Console.WriteLine("HRIZANTEME NISU ISTE!");

            // BASTA
            Basta b = new Basta();
            Console.WriteLine(b);

            // METODA UCITAJ I DODAJ
            b.UcitajHrizanteme("hrizanteme.txt");

            // METODA SORTIRAJ
            b.Sortiraj();
            Console.WriteLine(b);
        }
    }
}
