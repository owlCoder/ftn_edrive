using System;
using System.Collections.Generic;

namespace ODP_NET_example_template.Model
{
    public class Radnik
    {
        public int Mbr { get; set; }
        public string Ime { get; set; }
        public string Prz { get; set; }
        public string Sef { get; set; }
        public float Plt { get; set; }
        public float Pre { get; set; }
        public DateTime God { get; set; }

        public Radnik() { }

        public Radnik(int mbr, string ime, string prz, string sef, float plt, float pre, DateTime god)
        {
            Mbr = mbr;
            Ime = ime;
            Prz = prz;
            Sef = sef;
            Plt = plt;
            Pre = pre;
            God = god;
        }

        public override bool Equals(object obj)
        {
            return obj is Radnik radnik &&
                   Mbr == radnik.Mbr &&
                   Ime == radnik.Ime &&
                   Prz == radnik.Prz &&
                   Sef == radnik.Sef &&
                   Plt == radnik.Plt &&
                   Pre == radnik.Pre &&
                   God == radnik.God;
        }

        public override int GetHashCode()
        {
            int hashCode = 1666066016;
            hashCode = hashCode * -1521134295 + Mbr.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Ime);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Prz);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Sef);
            hashCode = hashCode * -1521134295 + Plt.GetHashCode();
            hashCode = hashCode * -1521134295 + Pre.GetHashCode();
            hashCode = hashCode * -1521134295 + God.GetHashCode();
            return hashCode;
        }

        internal static bool GetFormattedHeader()
        {
            throw new NotImplementedException();
        }
    }
}
