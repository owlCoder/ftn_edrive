using System.Collections.Generic;

namespace ODP_NET_example_template.Model
{
    public class Projekat
    {
        public int Spr { get; set; }
        public int Ruk { get; set; }
        public string Nap { get; set; }
        public string Nar { get; set; }

        public Projekat() { }

        public Projekat(int spr, int ruk, string nap, string nar)
        {
            Spr = spr;
            Ruk = ruk;
            Nap = nap;
            Nar = nar;
        }

        public override bool Equals(object obj)
        {
            return obj is Projekat projekat &&
                   Spr == projekat.Spr &&
                   Ruk == projekat.Ruk &&
                   Nap == projekat.Nap &&
                   Nar == projekat.Nar;
        }

        public override int GetHashCode()
        {
            int hashCode = 926678707;
            hashCode = hashCode * -1521134295 + Spr.GetHashCode();
            hashCode = hashCode * -1521134295 + Ruk.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Nap);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Nar);
            return hashCode;
        }
    }
}
