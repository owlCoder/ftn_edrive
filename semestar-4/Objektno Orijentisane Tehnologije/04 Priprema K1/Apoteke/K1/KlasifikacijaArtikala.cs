using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;
using System.Threading.Tasks;

namespace K1
{
    class KlasifikacijaArtikala : IDatoteka
    {
        private Apoteka apoteke;

        internal Apoteka Apoteke { get => apoteke; set => apoteke = value; }

        public KlasifikacijaArtikala()
        {
            apoteke = new Apoteka();
        }

        public void ProcitajTxt(string file)
        {
            TextReader tr = null;
            try
            {
                tr = new StreamReader(File.Open(file, FileMode.Open));
                // ocekivani format
                // sifra-naziv-opis-cena-kojaApoteka
                while(true)
                {
                    string line = tr.ReadLine();
                    if(line == null)
                        break;

                    string[] parts = line.Split('-');

                    int cena = 0;

                    try
                    {
                        cena = int.Parse(parts[3]);
                    }
                    catch(Exception e)
                    {
                        Console.WriteLine("\n" + e.Message);
                    }

                    Artikal tmp = new Artikal(parts[0], parts[1], parts[2], cena);

                    if (parts[4].ToLower() == "apoteka1")
                    {
                        try
                        {
                            apoteke.Dodaj(1, tmp);
                        }
                        catch (Exception e)
                        {
                            Console.WriteLine("\n" + e.Message);
                        }
                    }
                    else if(parts[4].ToLower() == "apoteka2")
                    {
                        try
                        {
                            apoteke.Dodaj(2, tmp);
                        }
                        catch (Exception e)
                        {
                            Console.WriteLine("\n" + e.Message);
                        }
                    }
                }
                
            }
            catch (Exception e)
            {
                Console.WriteLine("\n" + e.Message);
            }
            finally
            {
                if(tr != null)
                    tr.Close();
            }
        }

        public void ProcitajBin(string file)
        {
            FileStream fs = null;
            BinaryFormatter bf = new BinaryFormatter();

            try
            {
                fs = new FileStream(file, FileMode.Open, FileAccess.Read);
                apoteke = (Apoteka) bf.Deserialize(fs);
            }
            catch(Exception e)
            {
                Console.WriteLine("\n" + e.Message);
            }
            finally
            {
                if(fs != null)
                    fs.Close();
            }
        }
        public void SacuvajBin(string file)
        {
            FileStream fs = null;
            BinaryFormatter bf = new BinaryFormatter();

            try
            {
                fs = new FileStream(file, FileMode.Create);
                bf.Serialize(fs, apoteke);
            }
            catch(Exception e)
            {
                Console.WriteLine("\n" + e.Message);
            }
            finally
            {
                if(fs != null)
                    fs.Close();
            }
        }
    }
}
