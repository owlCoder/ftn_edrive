using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace _02_Rečnik
{
    public class Program
    {
        static void Main(string[] args)
        {
            Dictionary<int, List<string>> recnik = new Dictionary<int, List<string>>(10);
            List<string> lista_jedan = new List<string>(10);
            List<string> lista_dva = new List<string> { "hello", "ntp", "classroom", "exception"};
            List<string> lista_tri = new List<string>();

            for(int i = 0; i < 10; i++)
            {
                lista_jedan.Add(new Random().Next(1, 1000).ToString());
                Thread.Sleep(10);
                lista_tri.Add(new Random().Next(1, 1000).ToString());
                Thread.Sleep(10);
            }

            for(int i = 0; i < 10; i++)
            {
                if(!recnik.ContainsKey(i))
                {
                    List<string> dodati = null;
                    Thread.Sleep(10);

                    if(new Random().Next(1, 3) == 1)
                    {
                        dodati = lista_jedan;
                    }
                    else if (new Random().Next(1, 3) == 2)
                    {
                        dodati = lista_dva;
                    }
                    else
                    {
                        dodati = lista_tri;
                    }

                    recnik.Add(i, dodati);
                }
            }

            Console.WriteLine("{0, 16} {1, 22} {2, 15}", "<dictionary_key>", "<index_of_list_item>", "<string_value>");
            Console.WriteLine("-------------------------------------------------------");

            foreach (var element in recnik)
            {
                for (int i = 0; i < element.Value.Count; i++)
                {
                    Console.WriteLine("{0, 16} {1, 22} {2, 15}", element.Key, i, element.Value[i]);
                }

                Console.WriteLine("-------------------------------------------------------");
            }

            Console.ReadKey();
        }
    }
}
