using System.Collections.Generic;

namespace Nekretnine.Model
{
    public class Lice
    {
        public string Idl { get; set; }
        public string ImeL { get; set; }
        public string Przl { get; set; }
        public string Vrstal { get; set; }
        public double Mes_prihodil { get; set; }

        public Lice(string idl, string imeL, string przl, string vrstal, double mes_prihodil)
        {
            Idl = idl;
            ImeL = imeL;
            Przl = przl;
            Vrstal = vrstal;
            Mes_prihodil = mes_prihodil;
        }

        public static string GetFormattedHeader()
        {
            return string.Format("{0, -8}{1, -20}{2, -20}{3, -12}{4, -10}", "IDL", "IME", "PREZIME", "VRSTA LICA", "PRIHODI");
        }

        public override string ToString()
        {
            return string.Format("{0, -8}{1, -20}{2, -20}{3, -12}{4, -10}", Idl, ImeL, Przl, Vrstal, Mes_prihodil);
        }

        public override bool Equals(object obj)
        {
            return obj is Lice lice &&
                   Idl == lice.Idl &&
                   ImeL == lice.ImeL &&
                   Przl == lice.Przl &&
                   Vrstal == lice.Vrstal &&
                   Mes_prihodil == lice.Mes_prihodil;
        }

        public override int GetHashCode()
        {
            int hashCode = -555954730;
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Idl);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(ImeL);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Przl);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Vrstal);
            hashCode = hashCode * -1521134295 + Mes_prihodil.GetHashCode();
            return hashCode;
        }
    }
}
