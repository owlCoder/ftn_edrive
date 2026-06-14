using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_example_template.Model
{
    public class VrstaNek
    {
        public int Idvn { get; set; }
        public string Nazivv { get; set; }

        public VrstaNek()
        {
        }

        public VrstaNek(int idvn, string nazivv)
        {
            Idvn = idvn;
            Nazivv = nazivv;
        }

        public override string ToString()
        {
            return string.Format("{0,4} {1,-15}", Idvn, Nazivv);
        }

        public static string GetFormattedHeader()
        {
            return string.Format("{0,4} {1,-15}", "Idvn", "Nazivv");
        }

        public override bool Equals(object obj)
        {
            return obj is VrstaNek nek &&
                   Idvn == nek.Idvn &&
                   Nazivv == nek.Nazivv;
        }

        public override int GetHashCode()
        {
            int hashCode = -638129183;
            hashCode = hashCode * -1521134295 + Idvn.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Nazivv);
            return hashCode;
        }
    }
}
