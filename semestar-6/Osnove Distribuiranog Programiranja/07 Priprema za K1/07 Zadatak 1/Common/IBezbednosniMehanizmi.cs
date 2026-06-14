using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public interface IBezbednosniMehanizmi
    {
        string Autentifikacija(string korisnickoIme, string lozinka);
    }
}
