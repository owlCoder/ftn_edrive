using Common;
using System;
using System.ServiceModel;
using System.Threading;

namespace Client
{
    class Program
    {
        static void Main(string[] args)
        {
            while(true)
            {
                ChannelFactory<IStudentskaSluzba> kanal;
                ChannelFactory<IBezbedonosniMehanizmi> kanalBezbednost;
                IStudentskaSluzba proxy;
                IBezbedonosniMehanizmi proxyBezbednost;

                string token = "";

                // ostvarivanje komunikacije
                try
                {
                    kanal = new ChannelFactory<IStudentskaSluzba>("StudentskaSluzbaServis");
                    kanalBezbednost = new ChannelFactory<IBezbedonosniMehanizmi>("ServisBezbednost");
                    proxy = kanal.CreateChannel();
                    proxyBezbednost = kanalBezbednost.CreateChannel();

                    // autentifikacija korisnika
                    try
                    {
                        Console.Write("Unesite korisnicko ime: ");
                        string korisnickoIme = Console.ReadLine();

                        Console.Write("Unesite lozinku: ");
                        string lozinka = Console.ReadLine();

                        token = proxyBezbednost.Autentifikacija(korisnickoIme, lozinka);
                    }
                    catch (FaultException<BezbedonosniMehanizmiIzuzetak> e)
                    {
                        Console.WriteLine("[AUTH ERROR] " + e.Detail.Razlog);
                    }

                    // Rad sa servisom

                    // Uzorni studenti ha-ha
                    Student s1 = new Student("Danijel", "Jovanovic", "PR 55/2020");
                    Student s2 = new Student("Nevenka", "Nenic", "PR 15/2020");
                    Student s3 = new Student("Ana", "Marinkovic", "PR 14/2020");

                    // dodavanje studenta 1
                    try
                    {
                        proxy.DodajStudenta(s1, token);
                    }
                    catch (FaultException<BezbedonosniMehanizmiIzuzetak> be)
                    {
                        Console.WriteLine("[AUTH ERROR]: " + be.Detail.Razlog);
                    }
                    catch (FaultException<StudentskaSluzbaIzuzetak> se)
                    {
                        Console.WriteLine("[SS ERROR]: " + se.Detail.Razlog);
                    }

                    // dodavanje studenta 2
                    try
                    {
                        proxy.DodajStudenta(s2, token);
                    }
                    catch (FaultException<BezbedonosniMehanizmiIzuzetak> be)
                    {
                        Console.WriteLine("[AUTH ERROR]: " + be.Detail.Razlog);
                    }
                    catch (FaultException<StudentskaSluzbaIzuzetak> se)
                    {
                        Console.WriteLine("[SS ERROR]: " + se.Detail.Razlog);
                    }

                    // izmena i prikaz studenta broj 1
                    try
                    {
                        s1.Prezime = "Ivic";
                        proxy.IzmeniStudenta(s1, token);

                        // prikaz studenta 1
                        if (proxy.PronadjiStudenta(s1.BrojIndeksa, out Student pronadjeni, token))
                        {
                            Console.Write("\n============== STUDENT S1 =============\n");
                            Console.WriteLine("Indeks:  " + s1.BrojIndeksa);
                            Console.WriteLine("Ime:     " + s1.Ime);
                            Console.WriteLine("Prezime: " + s1.Prezime);
                        }
                        else
                        {
                            Console.Write("\n============== STUDENT NIJE PRONADJEN! =============\n");
                        }
                    }
                    catch (FaultException<BezbedonosniMehanizmiIzuzetak> be)
                    {
                        Console.WriteLine("[AUTH ERROR]: " + be.Detail.Razlog);
                    }
                    catch (FaultException<StudentskaSluzbaIzuzetak> se)
                    {
                        Console.WriteLine("[SS ERROR]: " + se.Detail.Razlog);
                    }

                    // dodavanje studenta 3
                    try
                    {
                        proxy.DodajStudenta(s3, token);
                    }
                    catch (FaultException<BezbedonosniMehanizmiIzuzetak> be)
                    {
                        Console.WriteLine("[AUTH ERROR]: " + be.Detail.Razlog);
                    }
                    catch (FaultException<StudentskaSluzbaIzuzetak> se)
                    {
                        Console.WriteLine("[SS ERROR]: " + se.Detail.Razlog);
                    }

                    // izmena i prikaz studenta broj 2
                    try
                    {
                        s2.Prezime = "Jovanovic";
                        proxy.IzmeniStudenta(s2, token);
                    }
                    catch (FaultException<BezbedonosniMehanizmiIzuzetak> be)
                    {
                        Console.WriteLine("[AUTH ERROR]: " + be.Detail.Razlog);
                    }
                    catch (FaultException<StudentskaSluzbaIzuzetak> se)
                    {
                        Console.WriteLine("[SS ERROR]: " + se.Detail.Razlog);
                    }

                    // brisanje studenta 1
                    try
                    {
                        proxy.IzbrisiStudenta(s1.BrojIndeksa, token);
                    }
                    catch (FaultException<BezbedonosniMehanizmiIzuzetak> be)
                    {
                        Console.WriteLine("[AUTH ERROR]: " + be.Detail.Razlog);
                    }
                    catch (FaultException<StudentskaSluzbaIzuzetak> se)
                    {
                        Console.WriteLine("[SS ERROR]: " + se.Detail.Razlog);
                    }

                    // citanje studenta 1 - ne postoji vise
                    try
                    {
                        // prikaz studenta 1
                        if (proxy.PronadjiStudenta(s1.BrojIndeksa, out Student pronadjeni, token))
                        {
                            Console.Write("\n============== STUDENT S1 =============\n");
                            Console.WriteLine("Indeks:  " + s1.BrojIndeksa);
                            Console.WriteLine("Ime:     " + s1.Ime);
                            Console.WriteLine("Prezime: " + s1.Prezime);
                        }
                        else
                        {
                            Console.Write("\n============== STUDENT NIJE PRONADJEN! =============\n");
                        }
                    }
                    catch (FaultException<BezbedonosniMehanizmiIzuzetak> be)
                    {
                        Console.WriteLine("[AUTH ERROR]: " + be.Detail.Razlog);
                    }
                    catch (FaultException<StudentskaSluzbaIzuzetak> se)
                    {
                        Console.WriteLine("[SS ERROR]: " + se.Detail.Razlog);
                    }

                    // izmena studenta broj 3
                    try
                    {
                        s3.Prezime = "Anovic";
                        proxy.IzmeniStudenta(s3, token);
                    }
                    catch (FaultException<BezbedonosniMehanizmiIzuzetak> be)
                    {
                        Console.WriteLine("[AUTH ERROR]: " + be.Detail.Razlog);
                    }
                    catch (FaultException<StudentskaSluzbaIzuzetak> se)
                    {
                        Console.WriteLine("[SS ERROR]: " + se.Detail.Razlog);
                    }

                    // izmena studenta broj 1
                    try
                    {
                        s1.Prezime = "Jovanovic";
                        proxy.IzmeniStudenta(s1, token);
                    }
                    catch (FaultException<BezbedonosniMehanizmiIzuzetak> be)
                    {
                        Console.WriteLine("[AUTH ERROR]: " + be.Detail.Razlog);
                    }
                    catch (FaultException<StudentskaSluzbaIzuzetak> se)
                    {
                        Console.WriteLine("[SS ERROR]: " + se.Detail.Razlog);
                    }

                    Console.WriteLine("\nTrenutno u listi studenata {0}.\n\n", proxy.BrojStudenata());

                    Thread.Sleep(10000);
                }
                catch (Exception e)
                {
                    Console.WriteLine("[ERROR] " + e.Message);
                }
            }
        }
    }
}
