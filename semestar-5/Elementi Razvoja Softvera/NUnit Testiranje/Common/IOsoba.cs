using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public enum Pol { MUSKI, ZENSKI }
    public interface IOsoba
    {
        string JMBG { get; set;  }
        string Ime { get; set; }
        string Prezime { get; set; }
        DateTime DatumRodjenja { get; set; }
        Pol PolOsobe { get; set; }

        bool ProveraJMBG(string jmbg);
        bool ProveraIme(string ime);
        bool ProveraPrezime(string prezime);
    }
}
