using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_example_template.DTO
{
    public class RutaDto
    {
        public string Idr { get; set; }
        public string Prev { get; set; }
        public string Polaz { get; set; }
        public string Odred { get; set; }
        public float Cena { get; set; }
        public string Valuta { get; set; }

        public string NazivP { get; set; }

        public RutaDto(string idr, string prev, string polaz, string odred, float cena, string valuta, string nazivp)
        {
            Idr = idr;
            Prev = prev;
            Polaz = polaz;
            Odred = odred;
            Cena = cena;
            Valuta = valuta;
            NazivP = nazivp;
        }

        public RutaDto()
        {
        }

        public override string ToString()
        {
            return string.Format("{0,4} {1,-10} {2,3} {3,3} {4,5:F2} {5,-6} {6, -20}", Idr, Prev, Polaz, Odred, Cena, Valuta, NazivP);
        }

        public static string GetFormattedHeader()
        {
            return string.Format("{0,4} {1,-10} {2,3} {3,3} {4,5} {5,-6} {6, -20}", "Idr", "Prev", "Polaz", "Odred", "Cena", "Valuta", "NAZIV_PREVOZNIKA");
        }
    }
}
