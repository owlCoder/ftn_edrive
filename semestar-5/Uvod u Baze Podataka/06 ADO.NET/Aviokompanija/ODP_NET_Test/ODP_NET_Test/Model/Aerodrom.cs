using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_example_template.Model
{
    public class Aerodrom
    {
        public string Ida { get; set; }
        public string Naziva { get; set; }
        public string Grada { get; set; }

        public Aerodrom()
        {
        }

        public Aerodrom(string ida, string naziva, string grada)
        {
            Ida = ida;
            Naziva = naziva;
            Grada = grada;
        }

        public override bool Equals(object obj)
        {
            return obj is Aerodrom aerodrom &&
                   Ida == aerodrom.Ida &&
                   Naziva == aerodrom.Naziva &&
                   Grada == aerodrom.Grada;
        }

        public override int GetHashCode()
        {
            int hashCode = -546811693;
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Ida);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Naziva);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Grada);
            return hashCode;
        }

        public override string ToString()
        {
            return string.Format("{0,4} {1,-15} {2,5}", Ida, Naziva, Grada);
        }

        public static string GetFormattedHeader()
        {
            return string.Format("{0,4} {1,-15} {2,5}", "Ida", "Naziva", "Grada");
        }

    }
}
