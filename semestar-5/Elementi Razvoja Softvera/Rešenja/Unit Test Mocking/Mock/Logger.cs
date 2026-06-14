using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mock
{
    public class Logger : ILogger
    {
        public void Info(string message)
        {
            Console.WriteLine("-----------------INFO-----------------");
            Console.WriteLine(message);
            Console.WriteLine("-----------------INFO-----------------");
        }
    }
}
