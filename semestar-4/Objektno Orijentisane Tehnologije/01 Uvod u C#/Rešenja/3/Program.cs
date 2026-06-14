using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z3
{
    class Program
    {
        static void Main(string[] args)
        {
            Valjak v = new Valjak(2, 4);

            Console.WriteLine("Povrsina valjka je: " + v.GetP());
            Console.WriteLine("Zapremina valjka je: " + v.GetV());

            // Console.ReadLine();
        }
    }
}
