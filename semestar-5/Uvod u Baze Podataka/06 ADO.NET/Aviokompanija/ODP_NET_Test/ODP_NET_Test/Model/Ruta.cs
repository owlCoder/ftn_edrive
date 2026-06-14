using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace ODP_NET_example_template.Model
{
    public class Ruta
    {
        public string Idr { get; set; }
        public string Prev { get; set; }
        public string Polaz { get; set; }
        public string Odred { get; set; }
        public float Cena { get; set; }
        public string Valuta { get; set; }

        public Ruta(string idr, string prev, string polaz, string odred, float cena, string valuta)
        {
            Idr = idr;
            Prev = prev;
            Polaz = polaz;
            Odred = odred;
            Cena = cena;
            Valuta = valuta;
        }

        public Ruta()
        {
        }

        public override bool Equals(object obj)
        {
            return obj is Ruta ruta &&
                   Idr == ruta.Idr &&
                   Prev == ruta.Prev &&
                   Polaz == ruta.Polaz &&
                   Odred == ruta.Odred &&
                   Cena == ruta.Cena &&
                   Valuta == ruta.Valuta;
        }

        public override int GetHashCode()
        {
            int hashCode = -576093482;
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Idr);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Prev);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Polaz);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Odred);
            hashCode = hashCode * -1521134295 + Cena.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Valuta);
            return hashCode;
        }

        public override string ToString()
        {
            return string.Format("{0,4} {1,-10} {2,3} {3,3} {4,5:F2} {5,-6}", Idr, Prev, Polaz, Odred, Cena, Valuta);
        }

        public static string GetFormattedHeader()
        {
            return string.Format("{0,4} {1,-10} {2,3} {3,3} {4,5} {5,-6}", "Idr", "Prev", "Polaz", "Odred", "Cena", "Valuta");
        }
    }
}
