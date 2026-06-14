using System;

namespace PripremaK1
{
    class Program
    {
        static void Main(string[] args)
        {
            Osoba o1 = new Osoba("Milena", "Kovacevic");
            Osoba o2 = new Osoba();

            Student s1 = new Student();
            Student s2 = new Student();
            Student s3 = new Student("Danijel", "Jovanovic", "PR55-2020", 55, 2020);

            Console.WriteLine(s3);
            Console.WriteLine();
            Console.WriteLine(s1.Equals(s3) ? "Isti studenti!" : "Nisu isti studenti!");

            Fakultet ftn = new Fakultet();

            Console.WriteLine(ftn);
            ftn.UpisiStudente("Studenti.txt");
            Console.WriteLine("\n------------------------ UPIS STUDENATA -----------------------\n");
            Console.WriteLine(ftn);

            Console.WriteLine("\n------------------------ SORT STUDENATA -----------------------\n");
            ftn.SortirajStudente();
            Console.WriteLine(ftn);

            Console.WriteLine("-------------------------- UPIS U Sortirano.txt -----------------------\n");
            App.SaveToFile(ftn.ToString(), "Sortirano.txt");
        }
    }   
}
