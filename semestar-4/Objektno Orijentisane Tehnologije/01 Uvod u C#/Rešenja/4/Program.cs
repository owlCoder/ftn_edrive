using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z1
{
    class Program
    {
        static void Main(string[] args)
        {
            Pravougaonik p = new Pravougaonik(2, 3);
            Krug k = new Krug(4);
            Kvadrat kv = new Kvadrat(5);


            // ToString testiranje
            Console.WriteLine(p);
            Console.WriteLine(k);
            Console.WriteLine(kv);

            // IspisiFiguru testiranje
            Console.WriteLine();
            IspisiFiguru(p);
            IspisiFiguru(k);
            IspisiFiguru(kv);

            
            // Virtualnost ToString i Porperty

            Console.WriteLine();
            p = kv;
            Console.WriteLine(kv); 
            Console.WriteLine(p); // ToString je override/virtual
            IspisiPravougaonik(p);
            Console.WriteLine();

            p.A = 12;
            Console.WriteLine(kv);
            Console.WriteLine(p);
            IspisiPravougaonik(p);
            Console.WriteLine();

            // zameniti u klasi Kvadrat kod svojstva A "override" sa "new" i posmatrati razlike


        }

        private static void IspisiFiguru(GeometrijskaFigura g)
        {
            Console.WriteLine(g);
            Console.WriteLine("Povrsina je: " + g.GetP());
            Console.WriteLine("Obim je: " + g.GetO());
            Console.WriteLine();
        }

        // pomocna metoda da se prikaze virtualnost propertija
        // nije deo zadatka
        private static void IspisiPravougaonik(Pravougaonik p)
        {
            Console.WriteLine("Pravougaonik: a = " + p.A + ", b = " + p.B);
        }


    }
}
