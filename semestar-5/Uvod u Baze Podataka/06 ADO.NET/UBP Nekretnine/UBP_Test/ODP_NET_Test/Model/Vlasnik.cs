using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_example_template.Model
{
    public class Vlasnik
    {
        public string Idv { get; set; }
        public string Imev { get; set; }
        public string Przv { get; set; }
        public string Vrstav { get; set; }

        public Vlasnik()
        {
        }

        public Vlasnik(string idv, string imev, string przv, string vrstav)
        {
            Idv = idv;
            Imev = imev;
            Przv = przv;
            Vrstav = vrstav;
        }

        public override string ToString()
        {
            return string.Format("{0,4} {1,-10} {2,-15} {3,10}", Idv, Imev, Przv, Vrstav);
        }

        public static string GetFormattedHeader()
        {
            return string.Format("{0,4} {1,-10} {2,-15} {3,10}", "Idv", "Imev", "Przv", "Vrstav");
        }

        public override bool Equals(object obj)
        {
            return obj is Vlasnik vlasnik &&
                   Idv == vlasnik.Idv &&
                   Imev == vlasnik.Imev &&
                   Przv == vlasnik.Przv &&
                   Vrstav == vlasnik.Vrstav;
        }

        public override int GetHashCode()
        {
            int hashCode = -1561480694;
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Idv);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Imev);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Przv);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Vrstav);
            return hashCode;
        }
    }
}
