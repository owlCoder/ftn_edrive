using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_example_template.Model
{
    public class Grad
    {
        public string Idg { get; set; }
        public string Nazivg { get; set; }
        public string Drz { get; set; }

        public Grad()
        {
        }

        public Grad(string idg, string nazivg, string drz)
        {
            Idg = idg;
            Nazivg = nazivg;
            Drz = drz;
        }

        public override bool Equals(object obj)
        {
            return obj is Grad grad &&
                   Idg == grad.Idg &&
                   Nazivg == grad.Nazivg &&
                   Drz == grad.Drz;
        }

        public override int GetHashCode()
        {
            int hashCode = 1395487882;
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Idg);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Nazivg);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Drz);
            return hashCode;
        }

        public override string ToString()
        {
            return string.Format("{0,4} {1,-15} {2,3}", Idg, Nazivg, Drz);
        }

        public static string GetFormattedHeader()
        {
            return string.Format("{0,4} {1,-15} {2,3}", "Idg", "Nazivg", "Drz");
        }
    }
}
