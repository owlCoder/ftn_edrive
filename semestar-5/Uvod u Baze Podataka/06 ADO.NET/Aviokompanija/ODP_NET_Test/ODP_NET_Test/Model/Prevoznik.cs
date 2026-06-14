using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_example_template.Model
{
    public class Prevoznik
    {
        public string Idp { get; set; }
        public string Nazivp { get; set; }
        public string Gradp { get; set; }
        public int BrAvFlt { get; set; }

        public Prevoznik()
        {
        }

        public Prevoznik(string idp, string nazivp, string gradp, int brAvFlt)
        {
            Idp = idp;
            Nazivp = nazivp;
            Gradp = gradp;
            BrAvFlt = brAvFlt;
        }


        public override bool Equals(object obj)
        {
            return obj is Prevoznik prevoznik &&
                   Idp == prevoznik.Idp &&
                   Nazivp == prevoznik.Nazivp &&
                   Gradp == prevoznik.Gradp &&
                   BrAvFlt == prevoznik.BrAvFlt;
        }

        public override int GetHashCode()
        {
            int hashCode = 452430422;
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Idp);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Nazivp);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Gradp);
            hashCode = hashCode * -1521134295 + BrAvFlt.GetHashCode();
            return hashCode;
        }

        public override string ToString()
        {
            return string.Format("{0,4} {1,-10} {2,3} {3, 7}", Idp, Nazivp, Gradp, BrAvFlt);
        }

        public static string GetFormattedHeader()
        {
            return string.Format("{0,4} {1,-10} {2,3} {3, 7}", "Idp", "Nazivp", "Gradp", "BrAvFlt");
        }
    }
}
