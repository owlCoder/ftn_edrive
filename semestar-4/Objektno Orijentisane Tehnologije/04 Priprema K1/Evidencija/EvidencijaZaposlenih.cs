using System;
using System.Collections.Generic;
using System.IO;

namespace Evidencija
{
    class EvidencijaZaposlenih : Izvestaj
    {
        private Dictionary<int, Zaposleni> zaposleni;
        private string nazivFirme;
        private string adresa;

        public EvidencijaZaposlenih(string nazivFirme, string adresa)
        {
            NazivFirme = nazivFirme;
            Adresa = adresa;
            zaposleni = new Dictionary<int, Zaposleni>();
        }

        public string NazivFirme { get => nazivFirme; set => nazivFirme = value; }
        public string Adresa { get => adresa; set => adresa = value; }

        public int Plata(int id)
        {

            if(zaposleni.ContainsKey(id))
            {
                int danaRada = zaposleni[id].BrojRadnihDana;
                int danaBolovanja = zaposleni[id].Bolovanje;
                int dnevnica = zaposleni[id].Dnevnica;

                return (danaRada - danaBolovanja) * dnevnica;
            }
            else
                return -1;
        }
        public void UcitajZaposlene(string putanja)
        {
            TextReader tr = null;

            try
            {
                tr = new StreamReader(File.Open(putanja, FileMode.Open));
                
                while (true)
                {
                    string line = tr.ReadLine();
                    if (line == null)
                    {
                        break;
                    }
                    else
                    {
                        string[] delovi = line.Split('|');
                        Zaposleni tmp = new Zaposleni(Int32.Parse(delovi[0]), delovi[1], delovi[2], Int32.Parse(delovi[3]), Int32.Parse(delovi[4]), Int32.Parse(delovi[5]));
                        zaposleni.Add(Int32.Parse(delovi[0]), tmp);
                    }
                }
            }
            catch
            {
                Console.WriteLine("Datoteka ne postoji!\n");
            }
            finally
            {
                if (tr != null)
                    tr.Close();
            }
        }

        public Zaposleni NajboljiRadnik()
        {
            if (zaposleni.Count != 0)
            {
                Zaposleni max = zaposleni[1];
                foreach (int id in zaposleni.Keys)
                {
                    if (Plata(id) > Plata(max.Id))
                        max = zaposleni[id];
                }
                return max;
            }
            else
            {
                return null;
            }
            
        }

        public override string ToString()
        {
            string str = "==================================";
            str += "\n\t" + nazivFirme;
            str += "\n\t" + adresa;
            str += "\n==================================\n";

            foreach(Zaposleni z in zaposleni.Values)
            {
                str += z.ToString() + " " + Plata(z.Id) + " rsd\n";
            }
            return str;
        }
    }
}
