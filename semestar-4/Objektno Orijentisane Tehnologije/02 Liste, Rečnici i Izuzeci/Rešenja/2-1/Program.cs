using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z2_1
{
    class Program
    {
        static void Main(string[] args)
        {
            Student s1 = new Student("RA 1/16", "Jovan", "Jovanovic");
            Student s2 = new Student("RA 2/16", "Pera", "Peric");
            Student s3 = new Student("RA 3/16", "Ivana", "Ivanovic");

            Console.WriteLine("\n****************** Testiranje klase Ucionica ******************\n");

            Ucionica ucList = new Ucionica();

            ucList.DodajStudenta(s1);
            ucList.DodajStudenta(s2);
            ucList.DodajStudenta(s3);
            Console.WriteLine(ucList);

            try
            {
                ucList.UkloniStudenta(5);
            }
            catch (Exception e)
            {
                Console.WriteLine("Greska prilikom izbacivanja");
                Console.WriteLine(e.Message);
            }

            ucList.UkloniStudenta(1);
            Console.WriteLine(ucList);

            ucList.IsprazniUcionicu();
            Console.WriteLine(ucList);

            Console.WriteLine("\n****************** Testiranje klase Ucionica2 ******************\n");

            UcionicaMap ucMap = new UcionicaMap();
            ucMap.DodajStudenta(s1);
            ucMap.DodajStudenta(s2);
            ucMap.DodajStudenta(s3);
            Console.WriteLine(ucMap);

            Student s4 = new Student("RA 2/16", "Đorđe", "Đorđević"); // isti broj indeksa kao Pera
            try
            {
                ucMap.DodajStudenta(s4);
            }
            catch (Exception e)
            {
                Console.WriteLine("Greska prilikom dodavanja");
                Console.WriteLine(e.Message);
            }


            ucMap.UkloniStudenta("RA 2/16");
            Console.WriteLine(ucMap);

            ucMap.IsprazniUcionicu();
            Console.WriteLine(ucMap);

        }
    }
}
