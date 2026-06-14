using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OsobaTest;

namespace MainApplication
{
    class Program
    {
        static void Main(string[] args)
        {
            OsobaTest.OsobaTest ot = new OsobaTest.OsobaTest();

            ot.ProveriJMBG();
            ot.ProveraIme();
            ot.ProveraPrezime();
        }
    }
}
