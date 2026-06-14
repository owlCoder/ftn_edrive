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
            Pravougaonik p = new Pravougaonik(2, 3);
            Krug k = new Krug(4);
            Kvadrat kv = new Kvadrat(5);

            Console.WriteLine(p);
            Console.WriteLine(k);
            Console.WriteLine(kv);

        }
    }
}
