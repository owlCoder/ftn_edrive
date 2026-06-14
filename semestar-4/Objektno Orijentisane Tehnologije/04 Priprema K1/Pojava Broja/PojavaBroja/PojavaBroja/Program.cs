using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PojavaBroja
{
    class Program
    {
        static void Main(string[] args)
        {
            Evidencija ev = new Evidencija();
            PojavaBroja pb1 = new PojavaBroja();
            PojavaBroja pb2 = new PojavaBroja(3, 5);
            PojavaBroja pb3 = new PojavaBroja();

            ev.Import();
            ev.SaveMap();
            ev.Save();

            Console.WriteLine(pb1.Equals(pb3));
            Console.WriteLine(pb1.Equals(pb2));
            Console.WriteLine(pb2);
        }
    }
}
