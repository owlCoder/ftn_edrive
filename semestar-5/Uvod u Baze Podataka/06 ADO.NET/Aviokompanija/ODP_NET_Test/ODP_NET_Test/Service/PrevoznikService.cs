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
    public class PrevoznikService
    {
        private  static readonly IPrevoznik prevoznikDao = new PrevoznikDaoImpl();
        public List<Prevoznik> FindAll()
        {
            return prevoznikDao.FindAll().ToList();
        }

        public Prevoznik GetById(string id)
        {
            return prevoznikDao.FindById(id);
        }

        public void Save(Prevoznik prevoznik)
        {
            prevoznikDao.Save(prevoznik);
        }

        public void DeleteById(string id)
        {
            prevoznikDao.DeleteById(id);
        }
    }
}
