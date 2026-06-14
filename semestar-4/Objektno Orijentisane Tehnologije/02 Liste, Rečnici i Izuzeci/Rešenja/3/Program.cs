using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z3
{
    class Program
    {
        static void Main(string[] args)
        {
            //inicijalizacija stringa
            string name = "Scala"; 
            string name_1 = "Scala";
            string name_2 = name + name_1; 

            char[] nameArray = { 'S', 'c', 'a', 'l', 'a' };
            string name_3 = new string(nameArray);


            //poredjenje stringova
            string str1 = "This is test";
            string str2 = "This is text";
            string str3 = str2;
            string str4 = str3 + "";

            if (str1 == str2)
                Console.WriteLine(str1 + " and " + str2 + " are equal.");
            else
                Console.WriteLine(str1 + " and " + str2 + " are not equal.");

            if (str3 == str2)
                Console.WriteLine(str3 + " and " + str2 + " are equal.");
            else
                Console.WriteLine(str3 + " and " + str2 + " are not equal.");

            if (str4 == str3)
                Console.WriteLine(str4 + " and " + str3 + " are equal.");
            else
                Console.WriteLine(str4 + " and " + str3 + " are not equal.");


            str1 = "This Is A String";
            str2 = "This is a string";

            //case sensitive poredjenje stringova
            if (String.Compare(str1, str2) == 0)
                Console.WriteLine("Case sensitive comparison: " + str1 + " and " + str2 + " are equal.");
            else
                Console.WriteLine("Case sensitive comparison: " + str1 + " and " + str2 + " are not equal.");

            //case insensitive poredjenje stringova
            if (String.Compare(str1, str2, true) == 0)
                Console.WriteLine("Case insensitive comparison:" + str1 + " and " + str2 + " are equal.");
            else
                Console.WriteLine("Case insensitive comparison:" + str1 + " and " + str2 + " are not equal.");


            Console.WriteLine("-------------------------------------");

            //odredjivanje duzine stringa
            string palindrome = "Dot saw I was Tod";
            int len = palindrome.Length;
            Console.WriteLine("string Length is : " + len);


            Console.WriteLine("-------------------------------------");


            // reverse
            string original, reverse = "";

            Console.WriteLine("Enter a string to reverse");
            original = Console.ReadLine();

            int length = original.Length;

            for (int i = length - 1; i >= 0; i--)
                reverse = reverse + original[i]; 

            Console.WriteLine("Reverse of entered string is: " + reverse);

            



            Console.WriteLine("-------------------------------------");

            // konkatenacija
            string kon1 = "naj";
            string kon2 = "jaci";

            //konkatenacija sa metodom Concat
            string s2 = String.Concat(kon1, kon2);
            Console.WriteLine(s2);

            //konkatenacija sa operatorom +
            string s3 = kon1 + kon2;
            Console.WriteLine(s3);


            Console.WriteLine("-------------------------------------");


            //testiranje metoda IndexOf i LastIndexOf
            string str = "To code in C# or not to code in C#, that is the question";

            if (str.IndexOf("C#") != -1)
            {
                Console.WriteLine("string contains C# at index :" + str.IndexOf("C#"));
            }

            if (str.LastIndexOf("C#") != -1)
            {
                Console.WriteLine("string contains C# and its last occurence is at: " + str.LastIndexOf("C#"));
            }


            Console.WriteLine("-------------------------------------");

            //testiranje Substring metode
            string all = "Danas nam je divan dan";

            //vratice deo stringa pocevsi od indeksa 13, pa narednih 9 karaktera 
            string substring = all.Substring(13, 9);

            Console.WriteLine("Substring: " + substring);


            Console.WriteLine("-------------------------------------");


            //promena case-a stringa
            string cases = "ABCDEabcde1234567890!";

            string strLow = cases.ToLower();
            string strUp = cases.ToUpper();

            Console.WriteLine("Original: " + cases);
            Console.WriteLine("Lowercase version: " + strLow);
            Console.WriteLine("Uppercase version: " + strUp);


            Console.WriteLine("-------------------------------------");


            //testiranje metode Trim
            string triming = " String Trim Example ";
            Console.WriteLine("Original string:" + triming + ".");
            Console.WriteLine("After trim:" + triming.Trim() + ".");


            Console.WriteLine("-------------------------------------");


            //ubacivanje stringa na odredjenu poziciju unutar drugog stringa
            string s = "This test";
            Console.WriteLine("Original string: " + s);

            s = s.Insert(5, "is a ");
            Console.WriteLine("After Insert: " + s);


            //izbacivanje odredjenog dela stringa
            Console.WriteLine("Original string: " + s);

            str = str.Remove(4, 5);
            Console.WriteLine("After Remove: " + str);


            Console.WriteLine("-------------------------------------");


            //zamena karaktera karakterom
            string rep = "Let's replace letters like pro";
            Console.WriteLine("Return Value: " + rep.Replace('r', 'R'));


            //zamena niza karaktera nizom karaktera
            string replaceSample = "string replace Example of replacing Character Sequence, for Real";
            Console.WriteLine("Return Value: " + replaceSample.Replace("re", "RE"));


            Console.WriteLine("-------------------------------------");


            //pretvaranje velikih slova u mala i malih u velika
            string test = "mala VELIKA RaNdOm slova 123";
            Console.WriteLine("Testni string: " + test);
            Console.WriteLine("Mala slova: " + test.ToLower());
            Console.WriteLine("Velika slova: " + test.ToUpper());


            Console.WriteLine("-------------------------------------");


            //testiranje split metode sa jednim separatorom
            string ss1 = "J|M|P|C";
            string[] pieces = ss1.Split('|');
            foreach (string piece in pieces)
            {
                Console.WriteLine(piece);
            }

            //testiranje split metode sa vise razlicitih separatora
            string ss2 = "One,Two,Three Associates, Inc.";
            char[] delimiters = new char[] { ' ', ',' };

            string[] res = ss2.Split(delimiters);

            foreach (string subString in res)
            {
                Console.WriteLine(subString);
            }


            //spajanje elemenata niza stringova sa separatorom
            string[] starray = new string[]{"Down the way nights are dark",
                "And the sun shines daily on the mountain top",
                "I took a trip on a sailing ship",
                "And when I reached Jamaica",
                "I made a stop"};

            string spoj = String.Join("\n", starray);
            Console.WriteLine(spoj);


            Console.WriteLine("-------------------------------------");


            //testitanje formatiranja stringa
            DateTime dat = new DateTime(2012, 1, 17, 9, 30, 0);
            string city = "Chicago";
            int temp = -16;
            string output = String.Format("At {0} in {1}, the temperature was {2} degrees.",
                                          dat, city, temp);
            Console.WriteLine(output);

        }
    }
}
