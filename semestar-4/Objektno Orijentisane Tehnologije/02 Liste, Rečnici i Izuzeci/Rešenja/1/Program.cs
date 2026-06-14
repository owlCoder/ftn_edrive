using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z4
{
    class Program
    {
        static void Main(string[] args)
        {

            // Deljenje sa 0 

            int a = 5;
            int b = 0;

            try
            {
                Console.WriteLine("a / b = {0}", a / b);
            }
            catch  // ne navodi se koji izuzetak zelimo da obradimo vec ovo izvrsavamo u slucaju svakog izuzetka; ne preporucuje se
            {
                Console.WriteLine("Greška");
            }



            try
            {
                Console.WriteLine("a / b = {0}", a / b);
            }
            catch (Exception e)  // ako su nam potrebne informacije o izuzetku
            {
                Console.WriteLine("Greška: ");
                Console.WriteLine(e);
            }


            try
            {
                Console.WriteLine("a / b = {0}", a / b);
            }
            catch (DivideByZeroException) // ako znamo koji izuzetak ocekujemo; ne mora se navesti ime ako nam nece biti dalje potrebno
            {
                Console.WriteLine("Greška: deljenje sa nulom" );
            }



            // Format ulaza

            Console.WriteLine("Unesite identifikacioni broj: ");

            try
            {
                int id = Int32.Parse(Console.ReadLine());
                Console.WriteLine("Uspeno ucitan broj");
            }
            catch (FormatException fe) // uvek prvo obrada specificnijeg izuzetka
            {
                Console.WriteLine("Desio se FormatException: ");
                Console.WriteLine(fe.StackTrace);
            }
            catch (Exception e) // na kraju je najopstiji izuzetak - Exception
            {
                Console.WriteLine("Desio se Exception: ");
                Console.WriteLine(e.StackTrace);
            }
            finally
            {
                Console.WriteLine("Program je zavrsen.");
                Console.ReadLine();
            }



        }
    }
}
