using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public interface IOsoba
    {
        string Jmbg { get; set; }
        string Ime { get; set; }
        string Prezime { get; set; }
        DateTime DatumRodjenja { get; set; }
        Pol PolOsobe { get; set; }
        bool CheckJmbg(string jmbg);
    }
}
