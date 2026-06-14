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
            // promenljive p1 i p2 su reference na objekat klase Pravougaonik

            Pravougaonik p1 = new Pravougaonik(3, 4);
            Pravougaonik p2 = new Pravougaonik(p1);

            Console.WriteLine("Obim pravougaonika p1 je: " + p1.GetO() +
                    "\nPovrsina pravougaonika p1 je: " + p1.GetP());

            Console.WriteLine("Obim pravougaonika p2 je: {0}", p2.GetO());
            Console.WriteLine("Površina pravougaonika p2 je: {0}", p2.GetP());


            Krug k = new Krug(5);

            Console.WriteLine("Obim kruga je: " + k.GetO() + 
                Environment.NewLine + "Povrsina kruga je: " + k.GetP());




            // F5 - Start debugging - zatvoriće se kozola pa se linijom ispod ovo prevazilazi
            Console.ReadLine();
            // ctrl + F5  - Start without debugging - neće se zatvoriti konzola
        }
    }
}
