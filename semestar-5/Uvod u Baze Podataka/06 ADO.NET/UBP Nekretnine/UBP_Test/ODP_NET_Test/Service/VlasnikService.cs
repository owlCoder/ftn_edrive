using ODP_NET_example_template.DAO;
using ODP_NET_example_template.DTO;
using ODP_NET_example_template.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_example_template.Service
{
    public class VlasnikService
    {
        private static readonly IVlasnikDao vlasnikDao = new VlasnikDaoImpl();

        public List<Vlasnik> FindAll()
        {
            return vlasnikDao.FindAll().ToList();
        }

        public Vlasnik GetById(string id) 
        {
            return vlasnikDao.FindById(id);
        }

        public void Save(Vlasnik vlasnik) 
        {
            vlasnikDao.Save(vlasnik);
        }

        public void DeleteById(string id) 
        { 
            vlasnikDao.DeleteById(id);
        }

        public List<PomDto> KompleksIzvestaj()
        {
            return vlasnikDao.KompleksIzvestaj();
        }
    }
}
