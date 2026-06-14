using ODP_NET_example_template.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_example_template.DTO
{
    public class KompleksDTO
    {
        public Aerodrom Aerodrom { get; set; }
        public int Polazaka { get; set; }
        public int Dolazaka { get; set; }
        public List<RutaDto> RutaDtoL { get; set; }

        public KompleksDTO()
        {
            Aerodrom = new Aerodrom();
            Polazaka = 0;
            Dolazaka = 0;
            RutaDtoL = new List<RutaDto>();
        }
    }
}
