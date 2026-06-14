using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z3_1
{
    class Program
    {
        static void Main(string[] args)
        {
            string pom, palindrom;

            Console.Write("Unesite rečenicu: ");
            palindrom = Console.ReadLine();

            pom = palindrom.Replace(" ", "");
            pom = pom.ToLower();

            if (IsPalindrome1(pom)) //ili  if (IsPalindrome2(pom)) 
            {
                Console.WriteLine("\"{0}\" is a palindrome.", palindrom);
            }
            else
            {
                Console.WriteLine("\"{0}\" is NOT a palindrome.", palindrom);
            }
        }

        public static bool IsPalindrome1(string word)
        {
            bool ret = false;
            char[] temp = word.ToCharArray();

            Array.Reverse(temp);

            if (word == new String(temp))
                ret = true;

            return ret;
        }

        public static bool IsPalindrome2(string word)
        {
            bool ret = true;
            int duzina = word.Length;

            for (int i = 0; i < duzina / 2; i++)
            {
                if (word[i] != word[(duzina - 1) - i])
                {
                    ret = false;
                    break;
                }
            }

            return ret;
        }
    }
}
