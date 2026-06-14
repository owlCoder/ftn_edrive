using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace ODP_NET_example_template.Model
{
    public class PoreskaKartica
    {
        public int Idk { get; set; }
        public string Idv { get; set; }
        public float Saldo { get; set; }
        public float Dug { get; set; }
        public float Kamata { get; set; }
        
        public PoreskaKartica()
        {
        }


        public override string ToString()
        {
            return string.Format("{0,4} {1,5} {2,8:F2} {3,8:F2} {4,8:F2}", Idk, Idv, Saldo, Dug, Kamata);
        }

        public static string GetFormattedHeader()
        {
            return string.Format("{0,4} {1,5} {2,8} {3,8} {4,8}", "Idk", "Idv", "Saldo", "Dug", "Kamata");
        }
    }
}
