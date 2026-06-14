using Nekretnine.DAO;
using Nekretnine.DAO.DAOImpl;
using Nekretnine.DTO;
using Nekretnine.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nekretnine.Service
{
    public class ObjekatService
    {
        private static readonly IObjekat objekatDao = new ObjekatDaoImpl();

        // metoda koja pronalazi sve objekte na osnovu prosledjenog IDVO
        public List<Objekat> PronadjiObjekteZaIdvo(int idvo)
        {
            return objekatDao.PronadjiObjekteZaIdvo(idvo);
        }

        // metoda koja racuna ukupnu vrednost za dati idvo (tip objekta)
        public double UkupnaVrednostObjektaIdvo(int idvo)
        {
            return objekatDao.UkupnaVrednostObjektaIdvo(idvo);
        }

        // II Nacin pravimo poziv u service
        public TipObjektaUkupnaVrednostDTO UkupnaVrednostObjekti(int idvo) 
        {
            return objekatDao.PronadjiObjekteIUkupnuVrednost(idvo);
        }
    }
}
