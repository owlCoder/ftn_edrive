using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace K1
{
    class Program
    {
        static void Main(string[] args)
        {
            Artikal a1 = new Artikal();
            Artikal b1 = new Artikal("MR", "Bromazepan 500mg", "LECI SVE", 69);

            Console.WriteLine(a1.ToString() + "\n\n" + b1.ToString());

            Apoteka a = new Apoteka();
            Console.WriteLine(a);

            KlasifikacijaArtikala ka = new KlasifikacijaArtikala();

            Console.WriteLine(ka.Apoteke);
            ka.ProcitajBin("artikli.bin");
            //ka.ProcitajTxt("artikli.txt");
            Console.WriteLine(ka.Apoteke);

            //ka.SacuvajBin("artikli.bin");
            
        }
    }
}
