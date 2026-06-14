using System;
using System.Collections.Generic;
using System.IO;

namespace Pojava_Broja
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
            TextReader tr = null;
            try
            {
                tr = new StreamReader(File.Open(putanja, FileMode.Open));

                while (true)
                {
                    string red = tr.ReadLine();

                    if (red == null)
                    {
                        break;
                    }

                    // BROJEVI U ULAZNOJ DATOTECI ODVOJENI SU ,
                    string[] delovi = red.Split(',');

                    for (int i = 0; i < delovi.Length; i++)
                    {
                        // PRETVARANJE STRINGA U BROJ
                        int broj = Int32.Parse(delovi[i]);

                        // RECNIK JE TAKAV TIP DA DVA DODAVANJA DVA ISTA KLJUCA NIJE MOGUCE!
                        // AKO DODAJEMO BROJ KOJI SE VEC NALAZI U RECNIKU
                        // NECE BITI DODAT VEC CE SAMO POLJE ZA BROJ POJAVA TOG BROJA
                        // BIIT POVECANO ZA 1
                        if (brojevi.ContainsKey(broj))
                        {
                            brojevi[broj].NoEl++;
                        }
                        else
                        {
                            // BROJ NE POSTOJI U RECNIKU PA CEMO GA DODATI
                            PojavaBroja tmp = new PojavaBroja(broj, 1);
                            brojevi.Add(broj, tmp);
                        }
                    }
                }
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
        public void SaveMap(string putanja = "Brojevi.bin")
        {
            BinaryWriter tr = null;
            try
            {
                tr = new BinaryWriter(File.Open(putanja, FileMode.Create));
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
            TextWriter tr = null;
            try
            {
                tr = new StreamWriter(File.Open(putanja, FileMode.Create));
                string zaUpis = string.Empty;

                foreach (PojavaBroja broj in brojevi.Values)
                {

                    zaUpis += broj.ToString() + "\n";
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
