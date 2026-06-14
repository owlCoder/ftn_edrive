using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z31
{
    class Program
    {
        static void Main(string[] args)
        {
            TeloA a = new TeloA(2, 2, 4, 2, 8);
            Console.WriteLine(a);


            TeloB b = new TeloB(2);
            Console.WriteLine(b);

        }
    }
}
