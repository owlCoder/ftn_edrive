using System.IO;
using System.Collections.Generic;
using System;
using System.Runtime.Serialization.Formatters.Binary;

namespace Basta
{
    class Basta
    {
        private List<Hrizantema> hrizanteme;

        public Basta()
        {
            hrizanteme = new List<Hrizantema>();
        }

        public void UcitajHrizanteme(string putanja)
        {
            TextReader tr = null;

            try
            {
                tr = new StreamReader(File.Open(putanja, FileMode.Open));

                while(true)
                {
                    string linija = tr.ReadLine();

                    if (linija == null)
                        break;
                    else
                    {
                        string[] delovi = linija.Split('-');
                        bool zaliveno;

                        if (delovi[3].ToLower() == "da")
                            zaliveno = true;
                        else
                            zaliveno = false;

                        Hrizantema tmp = new Hrizantema(delovi[0], delovi[1], Int32.Parse(delovi[2]), zaliveno, 
                                                        Double.Parse(delovi[4]), delovi[5], Int32.Parse(delovi[6]));
                        hrizanteme.Add(tmp);
                    }
                }
            }
            catch(Exception e)
            {
                Console.WriteLine("\n" + e.Message);
            }
            finally
            {
                if (tr != null)
                    tr.Close();
            }
        }

        public void Sortiraj()
        {
            if(hrizanteme.Count > 1) // IMA SMISLA SORTIRATI AKO JE VISE OD 1 HRIZANTEME U BASTI
            {
                Hrizantema h1, h2;

                for(int i = 0; i < hrizanteme.Count - 1; i++)
                    for(int j = i + 1; j < hrizanteme.Count; j++)
                        if(hrizanteme[i].Starost > hrizanteme[j].Starost)
                            zameni(out h1, out h2, i, j);
                        else if( (hrizanteme[i].Starost == hrizanteme[j].Starost) 
                              && (hrizanteme[i].ProsecanBrojCvetova < hrizanteme[j].ProsecanBrojCvetova) )
                            zameni(out h1, out h2, i, j);
            }

            SacuvajUredjeneTekstualna();
            SacuvajUredjeneBinarna();
        }
        private void zameni(out Hrizantema h1, out Hrizantema h2, int i, int j)
        {
            h1 = hrizanteme[i];
            h2 = hrizanteme[j];

            hrizanteme.RemoveAt(i);
            hrizanteme.Insert(i, h2);

            hrizanteme.RemoveAt(j);
            hrizanteme.Insert(j, h1);
        }

        public void SacuvajUredjeneTekstualna(string putanja = "Uredjene.txt")
        {
            TextWriter tw = null;

            try
            {
                tw = new StreamWriter(File.Open(putanja, FileMode.Create));
                string str = "";

                foreach (Hrizantema h in hrizanteme)
                    str += h.ToString() + "\n";

                tw.Write(str);
            }
            catch(Exception e)
            {
                Console.WriteLine("\n" + e.Message);
            }
            finally
            {
                if (tw != null)
                    tw.Close();
            }
        }

        public void SacuvajUredjeneBinarna(string putanja = "garden.dat")
        {
            FileStream bw = null;

            try
            {
                bw = new FileStream(putanja, FileMode.Create);
                BinaryFormatter bf = new BinaryFormatter();

                try { bf.Serialize(bw, hrizanteme); }
                catch (Exception e) { Console.WriteLine("\n" + e.Message); }
            }
            catch (Exception e)
            {
                Console.WriteLine("\n" + e.Message);
            }
            finally
            {
                if (bw != null)
                    bw.Close();
            }
        }
        public override string ToString()
        {
            string str = "";
            str += "\n--------------------- BASTA ----------------------\n\n";

            foreach (Hrizantema h in hrizanteme)
                str += h.ToString() + "\n";

            if (hrizanteme.Count == 0)
                str += "\n\t\t  BASTA JE PRAZNA!\n\n";

            str += "--------------------------------------------------\n";

            return str;
        }
    }
}
