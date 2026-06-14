using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Z1; // pre ovoga, u projektu Z2, dodati referencu na projekat Z1


namespace Z2
{
    class TestNiz
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Niz realnih brojeva");

            double[] a = new double[3];
            // pristupanje elementima
            a[0] = 2.5;

            // iteracija kroz niz
            // koristimo polje Length koje poseduje svaki niz
            for (int i = 0; i < a.Length; i++)
            {
                Console.WriteLine("Element na poziciji " + i + " je " + a[i]);
            }


            Console.WriteLine();
            Console.WriteLine("Niz celih brojeva");

            int[] b = { 1, 7, 9, 3, 4 };
            for (int i = 0; i < b.Length; i++)
            {
                Console.WriteLine("Element na poziciji " + i + " je " + b[i]);
            }


            Console.WriteLine();
            Console.WriteLine("Niz objekata");

            Pravougaonik[] pravougaonici = new Pravougaonik[5];
            pravougaonici[0] = new Pravougaonik(10, 2);
            pravougaonici[1] = new Pravougaonik(5, 8);
            pravougaonici[2] = new Pravougaonik(3, 9);
            pravougaonici[3] = new Pravougaonik(7, 1);
            pravougaonici[4] = new Pravougaonik(6, 11);


            for (int i = 0; i < pravougaonici.Length; i++)
            {
                //Console.WriteLine("Pravougaonik na poziciji " + i + " ima povrsinu "
                //        + pravougaonici[i].GetP());

                Console.WriteLine("Pravougaonik na poziciji {0} ima povrsinu {1}", i, pravougaonici[i].GetP());
            }


            // pravougaonik sa najvećom površinom
            Console.WriteLine();

            Pravougaonik pMax = NajvecaPovrsina(pravougaonici);
            if (pMax != null) // metod moze da vrati null
            {
                Console.WriteLine("Pravougaonik sa najvecom povrsinom je pravougaonik sa stranicama " + pMax.GetA() + " i " + pMax.GetB());
            }

            // Console.ReadLine();
        }

        public static Pravougaonik NajvecaPovrsina(Pravougaonik[] pravougaonici)
        {
            if (pravougaonici == null)
                return null;

            Pravougaonik pMax = pravougaonici[0];
            for (int i = 1; i < pravougaonici.Length; i++)
            {
                if (pravougaonici[i].GetP() > pMax.GetP())
                {
                    pMax = pravougaonici[i];
                }
            }
            return pMax;
        }
    }
}
