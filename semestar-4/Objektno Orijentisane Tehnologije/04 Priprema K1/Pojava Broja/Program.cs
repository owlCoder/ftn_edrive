using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pojava_Broja
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

            Console.WriteLine(pb1.ToString() + " i " + pb2.ToString() + (pb1.Equals(pb2) == true ? " su jednaki" : " nisu jednaki") + ".");
            Console.WriteLine(pb2.ToString() + " i " + pb2.ToString() + (pb2.Equals(pb2) == true ? " su jednaki" : " nisu jednaki") + ".");
            Console.WriteLine("\nIspis objekta pb2: " + pb2);
        }
    }
}
