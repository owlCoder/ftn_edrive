using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;

namespace Osoba
{
    class Program
    {
        static void Main(string[] args)
        {
            Osoba o1 = new Osoba("Danijel", "Jovanovic");
            Osoba o2 = new Osoba("Milena", "Kovacevic");
            Osoba o3 = new Osoba(" ", " ");

            List<Osoba> osobe = new List<Osoba>();
            List<Osoba> osobe_read = new List<Osoba>();
            osobe.Add(o1); osobe.Add(o2); osobe.Add(o3);
            osobe.Add(o1); osobe.Add(o2); osobe.Add(o3);

            Console.Write(o1);
            Console.Write(o2);

            snimiOsobu(o1);
            snimiOsobu(o2);

            ucitajOsobu(o3);
            Console.WriteLine("\nUcitana osoba\n" + o3);

            snimiOsobe(osobe);
            ucitajOsobe(osobe_read);

            Console.WriteLine("\nOsobe iz liste txt: ");
            foreach(Osoba o in osobe_read)
            {
                Console.Write(o);
            }
        }
        static void snimiOsobu(Osoba o)
        {
            BinaryWriter binWriter = null;

            try
            {
                binWriter = new BinaryWriter(File.Open("osobe.dat", FileMode.Create));

                binWriter.Write(o.Ime);
                binWriter.Write(o.Prezime);
                binWriter.Write("\n");
            }
            catch(Exception e)
            {
                Console.WriteLine("\nGRESKA PRILIKOM UPISA U BINARNU DATOTEKU!\nError: " + e);
            }
            finally
            {
                if(binWriter != null)
                {
                    binWriter.Close();
                }
            }
        } 

        static void ucitajOsobu(Osoba o)
        {
            BinaryReader binReader = null;
        
            try
            {
                binReader = new BinaryReader(File.Open("osobe.dat", FileMode.Open));

                string ime = binReader.ReadString();
                string prezime = binReader.ReadString();

                o.Ime = ime;
                o.Prezime = prezime;
            }
            catch (Exception e)
            {
                Console.WriteLine("\nGRESKA PRILIKOM CITANJA U BINARNU DATOTEKU!\nError: " + e);
            }
            finally
            {
                if (binReader != null)
                {
                    binReader.Close();
                }
            }
        }

        static void snimiOsobe(List<Osoba> osobe)
        {
            TextWriter txtWriter = null;

            try
            {
                txtWriter = new StreamWriter(File.Open("osobe.txt", FileMode.Append));

                foreach (Osoba o in osobe)
                {
                    txtWriter.WriteLine(o.Ime + " " + o.Prezime);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("\nGRESKA PRILIKOM PISANJA U TEKSTUALNU DATOTEKU!\nError: " + e);
            }
            finally
            {
                if (txtWriter != null)
                {
                    txtWriter.Close();
                }
            }
        }

        static void ucitajOsobe(List<Osoba> osobe)
        {
            TextReader txtReader = null;

            try
            {
                txtReader = new StreamReader(File.Open("osobe.txt", FileMode.Open));

                if (File.Exists("osobe.txt"))
                {
                    while (true)
                    {
                        string str = txtReader.ReadLine();
                        if (str == null)
                        {
                            break;
                        }

                        string[] splitovano = str.Split(' ');
                        Osoba tmp = new Osoba(splitovano[0], splitovano[1]);
                        osobe.Add(tmp);
                    }
                }
            }
            catch(Exception e)
            {
                Console.WriteLine("\nGRESKA PRILIKOM PISANJA U TEKSTUALNU DATOTEKU!\nError: " + e);
            }
            finally
            {
                if (txtReader != null)
                    txtReader.Close();
            }
        }
    }
}
