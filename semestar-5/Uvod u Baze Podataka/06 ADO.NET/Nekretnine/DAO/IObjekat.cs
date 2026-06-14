using Nekretnine.DTO;
using Nekretnine.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nekretnine.DAO
{
    public interface IObjekat : ICRUDDao<Objekat, int>
    {
        // metoda koja pronalazi sve objekte na osnovu prosledjenog IDVO
        List<Objekat> PronadjiObjekteZaIdvo(int idvo);

        // metoda koja racuna ukupnu vrednost za dati idvo (tip objekta)
        double UkupnaVrednostObjektaIdvo(int idvo);

        // II NACIN
        TipObjektaUkupnaVrednostDTO PronadjiObjekteIUkupnuVrednost(int idvo);
    }
}
