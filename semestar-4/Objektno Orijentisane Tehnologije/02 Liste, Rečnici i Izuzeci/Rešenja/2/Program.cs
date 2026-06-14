using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z5
{
    class Program
    {
        static void Main(string[] args)
        {
            CDDisk d1 = new CDDisk(1, "Stari disk", "Orkestar");
            CDDisk d2 = new CDDisk(2, "Novi disk", "Orkestar");

            Console.WriteLine(d1);
            Console.WriteLine(d2);


            Console.WriteLine();
            Console.WriteLine("Storage");

            XCDStorage cds = new XCDStorage();
            Console.WriteLine(cds);


            Console.WriteLine();
            cds.Add(d1);
            cds.Add(d2);
            Console.WriteLine(cds);


            Console.WriteLine();
            CDDisk nadjen = cds.Find(1); 
            if (nadjen != null)
                Console.WriteLine("Nadjen disk: " + nadjen);
            else
                Console.WriteLine("Disk nije pronađen");


            Console.WriteLine();
            bool removed = cds.Remove(2);
            if (removed)
                Console.WriteLine("Disk uspešno uklonjen.");
            else
                Console.WriteLine("Greška prilikom uklanjanja");
            Console.WriteLine(cds);



            Console.WriteLine("-------------------------------------");

            Console.WriteLine();
            Console.WriteLine("StorageDictionary");

            XCDStorageDictionary cdsd = new XCDStorageDictionary();
            Console.WriteLine(cdsd);

            cdsd.Add(d1);
            cdsd.Add(d2);
            Console.WriteLine(cdsd);


            Console.WriteLine();
            nadjen = cdsd.Find(1); 
            if (nadjen != null)
                Console.WriteLine("Nadjen disk: " + nadjen);
            else
                Console.WriteLine("Disk nije pronađen");


            Console.WriteLine();
            removed = cdsd.Remove(2);
            if (removed)
                Console.WriteLine("Disk uspešno uklonjen.");
            else
                Console.WriteLine("Greška prilikom uklanjanja");
            Console.WriteLine(cdsd);




            // demonstracija problema sa uslovom za jedinstvenost uz mogucnost izmene polja koje sluzi za identifikaciju (public set property za id)
            Console.WriteLine();
            Console.WriteLine("-------------------------------------");

            // Lista

            cds.Add(d2); // vratimo u obe strukture
            cdsd.Add(d2);
            Console.WriteLine(cds);
            Console.WriteLine(cdsd);

            d2.Id = 1;
            Console.WriteLine(cds);
            Console.WriteLine(cdsd);

            // id vrednosti nece vise biti jedinstvene

            // Pogotovo kod recnika (i ostalih koje koriste hash funkcije za identifikaciju) treba voditi racuna
            // Ne menjati kljuceve!
            // Ako je neophodno menjati kljuc (izbegavati; nije ta namena) mora se elemenat izbaciti pa dodati ponovo novi sa novim kljucem
			// (izbegavati; nije ta namena)
            
        }
    }
}
