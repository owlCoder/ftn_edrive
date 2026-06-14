using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _03_Kastovanje
{
    public class Program
    {
        static void Main(string[] args)
        {
            try
            {
                var niz = new object[30000000];
                int zbir_duzina_stringova_1 = 0;
                int zbir_duzina_stringova_2 = 0;

                for(int i =  0; i < niz.Length; i++)
                {
                    if (i % 3 == 0)
                    {
                        niz[i] = null;
                    }
                    else if(i % 3 == 1)
                    {
                        niz[i] = "string_" + new Random().Next(1, 1000);
                    }
                    else if(i % 3 == 2)
                    {
                        niz[i] = new object();
                    }
                }

                // nacin 1
                for (int i = 0; i < niz.Length; i++)
                {
                    try
                    {
                        string element = (string)niz[i];

                        if (element != null)
                        {
                            zbir_duzina_stringova_1 += element.Length;
                        }
                    }
                    catch (Exception)
                    {
                        // continue;
                    }
                }

                // nacin 2
                for (int i = 0; i < niz.Length; i++)
                {
                    string element = niz[i] as string;

                    if (element != null)
                    {
                        zbir_duzina_stringova_2 += element.Length;
                    }
                }

                Console.WriteLine("Duzina 1: {0}\nDuzina 2: {1}", zbir_duzina_stringova_1, zbir_duzina_stringova_2);
            }
            catch (Exception exp) 
            {
                Console.WriteLine(exp.Message);
            }

            Console.ReadKey();
        }
    }
}
