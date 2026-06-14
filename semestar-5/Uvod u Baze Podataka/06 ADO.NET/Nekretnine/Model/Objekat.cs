using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nekretnine.Model
{
    public class Objekat
    {
        public int Ido { get; set; }
        public string Idl { get; set; }
        public int Idvo { get; set; }
        public double Povrsina { get; set; }
        public string Adresa { get; set; }
        public double Vrednost { get; set; }

        public Objekat(int ido, string idl, int idvo, double povrsina, string adresa, double vrednost)
        {
            Ido = ido;
            Idl = idl;
            Idvo = idvo;
            Povrsina = povrsina;
            Adresa = adresa;
            Vrednost = vrednost;
        }

        public override bool Equals(object obj)
        {
            return obj is Objekat objekat &&
                   Ido == objekat.Ido &&
                   Idl == objekat.Idl &&
                   Idvo == objekat.Idvo &&
                   Povrsina == objekat.Povrsina &&
                   Adresa == objekat.Adresa &&
                   Vrednost == objekat.Vrednost;
        }

        public override string ToString()
        {
            return string.Format("{0,-5}{1,-8}{2,-7}{3,-10}{4,-30}{5,-10}", Ido, Idl, Idvo, Povrsina, Adresa, Vrednost);
        }

        public static string GetFormattedHeader()
        {
            return string.Format("{0,-5}{1,-8}{2,-7}{3,-10}{4,-30}{5,-10}", "IDO", "IDL", "IDVO", "POVRSINA", "ADRESA", "VREDNOST");
        }

        public override int GetHashCode()
        {
            int hashCode = -143131362;
            hashCode = hashCode * -1521134295 + Ido.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Idl);
            hashCode = hashCode * -1521134295 + Idvo.GetHashCode();
            hashCode = hashCode * -1521134295 + Povrsina.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Adresa);
            hashCode = hashCode * -1521134295 + Vrednost.GetHashCode();
            return hashCode;
        }
    }
}
