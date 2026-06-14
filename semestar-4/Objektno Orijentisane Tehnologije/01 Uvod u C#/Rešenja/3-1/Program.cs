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
            PP3Prizma p = new PP3Prizma(2, 4);

            Console.WriteLine("Povrsina prizme je: " + p.GetP());
            Console.WriteLine("Zapremina prizme je: " + p.GetV());

            //Console.ReadLine();
        }
    }
}
