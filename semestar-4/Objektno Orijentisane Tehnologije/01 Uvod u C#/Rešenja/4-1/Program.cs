using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z11
{
    class Program
    {
        static void Main(string[] args)
        {
            Kvadar p = new Kvadar(2, 3, 4);
            Kocka k = new Kocka(4);

            IspisiPovrsinuiObim(p);
            IspisiPovrsinuiObim(k);

        }

        private static void IspisiPovrsinuiObim(GeometrijskoTelo g)
        {
            Console.WriteLine("Povrsina je: " + g.GetP());
            Console.WriteLine("Zapremina je: " + g.GetV() + "\n");
        }

    }
}
