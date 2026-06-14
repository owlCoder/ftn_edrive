using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public interface IRacun
    {
        IOsoba Vlasnik { get; set; }

        string BrojRacuna { get; set; }

        Decimal Stanje { get; set; }

        Decimal DozvoljeniMinus { get; set; }
    }
}
