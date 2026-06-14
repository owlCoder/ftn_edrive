using System;
using System.IO;

namespace PripremaK1
{
    class App
    {
        public static string LoadFromFile(string putanja)
        {
            TextReader txt = null;
            string sadrzaj = "";

            try
            {
                txt = new StreamReader(File.Open(putanja, FileMode.Open));

                while (true)
                {
                    string red = txt.ReadLine();

                    if (red == null)
                        break;

                    sadrzaj += red;
                }
            }
            catch(Exception e)
            {
                Console.WriteLine("\n" + e.Message);
            }
            finally
            {
                if (txt != null)
                    txt.Close();
            }
            return sadrzaj;
        }

        public static void SaveToFile(string zaUpis, string putanja)
        {
            TextWriter tw = null;

            try
            {
                tw = new StreamWriter(File.Open(putanja, FileMode.Create));
                tw.WriteLine(zaUpis);
            }
            catch (Exception e)
            {
                Console.WriteLine("\n" + e.Message);
            }
            finally
            {
                if (tw != null)
                    tw.Close();
            }
        }
    }
}
