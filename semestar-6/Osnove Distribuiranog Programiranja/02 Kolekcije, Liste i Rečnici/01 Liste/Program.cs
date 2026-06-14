using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _01_Liste
{
    public class Program
    {
        static void Main(string[] args)
        {
            List<int> lista = new List<int>(154357);
            long suma = 0;

            for(int i = 0;  i < lista.Capacity; i++) 
            { 
                if(i % 4 == 0)
                {
                    lista.Add(i);
                }
                else
                {
                    lista.Add(-i);
                }

                if (lista[i] % 17 == 0)
                {
                    suma += lista[i];
                }
            }

            Console.WriteLine("Suma deljivh sa 17 je: {0}", suma);
            Console.ReadKey();
        }
    }
}
