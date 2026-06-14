using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_example_template.Model
{
    public class Nekretnina
    {
        public int Idn { get; set; }
        public string Idv { get; set; }
        public float Kvd { get; set; }
        public string Adr { get; set; }
        public int BrNek { get; set; }
        public int BrSt { get; set; }
        public string Opstina { get; set; }
        public int IdVn { get; set; }

        public Nekretnina()
        {
        }

        public Nekretnina(int idn, string idv, float kvd, string adr, int brNek, int brSt, string opstina, int idVn)
        {
            Idn = idn;
            Idv = idv;
            Kvd = kvd;
            Adr = adr;
            BrNek = brNek;
            BrSt = brSt;
            Opstina = opstina;
            IdVn = idVn;
        }

        public override string ToString()
        {
            return string.Format("{0,4} {1,5} {2,4} {3,-15} {4,5} {5,4} {6,15} {7,4}",
                Idn, Idv, Kvd, Adr, BrNek, BrSt, Opstina, IdVn);
        }

        public static string GetFormattedHeader()
        {
            return string.Format("{0,4} {1,5} {2,4} {3,-15} {4,5} {5,4} {6,15} {7,4}",
                "Idn", "Idv", "Kvd", "Adr", "BrNek", "BrSt", "Opstina", "IdVn");
        }

        public override bool Equals(object obj)
        {
            return obj is Nekretnina nekretnina &&
                   Idn == nekretnina.Idn &&
                   Idv == nekretnina.Idv &&
                   Kvd == nekretnina.Kvd &&
                   Adr == nekretnina.Adr &&
                   BrNek == nekretnina.BrNek &&
                   BrSt == nekretnina.BrSt &&
                   Opstina == nekretnina.Opstina &&
                   IdVn == nekretnina.IdVn;
        }

        public override int GetHashCode()
        {
            int hashCode = -1328165766;
            hashCode = hashCode * -1521134295 + Idn.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Idv);
            hashCode = hashCode * -1521134295 + Kvd.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Adr);
            hashCode = hashCode * -1521134295 + BrNek.GetHashCode();
            hashCode = hashCode * -1521134295 + BrSt.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Opstina);
            hashCode = hashCode * -1521134295 + IdVn.GetHashCode();
            return hashCode;
        }
    }
}
