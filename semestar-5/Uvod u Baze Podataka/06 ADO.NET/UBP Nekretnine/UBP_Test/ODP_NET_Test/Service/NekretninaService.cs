using ODP_NET_example_template.DAO;
using ODP_NET_example_template.DAO.DAOImpl;
using ODP_NET_example_template.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_example_template.Service
{
    public class NekretninaService
    {
        private static readonly INekretninaDao nekretninaDao = new NekretninaDaoImpl();

        public List<Nekretnina> KvdVecaOd(float kvd)
        {
            return nekretninaDao.KvdVecaOd(kvd);
        }

        public void Transakcija(int idn, int brnek)
        {
            nekretninaDao.Transakcija(idn, brnek);
        }
    }
}
