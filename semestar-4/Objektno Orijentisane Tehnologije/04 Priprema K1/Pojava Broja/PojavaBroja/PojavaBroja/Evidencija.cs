using System;
using System.Collections.Generic;
using System.IO;

namespace PojavaBroja
{
    class Evidencija
    {
        Dictionary<int, PojavaBroja> brojevi;

        public Evidencija()
        {
            brojevi = new Dictionary<int, PojavaBroja>();
        }
        public void Import(string putanja = "Datoteka.txt")
        {
            TextReader tr = new StreamReader(File.Open(putanja, FileMode.Open));
            try
            {                
                while(true)
                {
                    string red = tr.ReadLine();

                    if(red == null)
                    {
                        break;
                    }

                    // split u ,
                    string[] delovi = red.Split(',');

                    for (int i = 0; i < delovi.Length; i++)
                    {
                        int broj = Int32.Parse(delovi[i]);

                        if(brojevi.ContainsKey(broj))
                        {
                            brojevi[broj].NoEl++;
                        }
                        else
                        {
                            PojavaBroja tmp = new PojavaBroja(broj, 1);
                            brojevi.Add(broj, tmp);
                        }
                    }
                }
            }
            catch(Exception e)
            {
                Console.WriteLine(e.Message);
            }
            finally
            {
                if (tr != null)
                    tr.Close();
            }
        }
        public void SaveMap(string putanja = "Brojevi.bin")
        {
            BinaryWriter tr = new BinaryWriter(File.Open(putanja, FileMode.Create));
            try
            {
                string zaUpis = string.Empty;
                
                foreach (PojavaBroja broj in brojevi.Values)
                {
                    zaUpis += broj.Broj.ToString();
                }

                tr.Write(zaUpis);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            finally
            {
                if (tr != null)
                    tr.Close();
            }
        }
        public void Save(string putanja = "PojavaBrojeva.txt")
        {
            BinaryWriter tr = new BinaryWriter(File.Open(putanja, FileMode.Create));
            try
            {
                string zaUpis = string.Empty;

                foreach (PojavaBroja broj in brojevi.Values)
                {
                    zaUpis += broj.ToString();
                }

                tr.Write(zaUpis);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            finally
            {
                if (tr != null)
                    tr.Close();
            }
        }
    }
}
