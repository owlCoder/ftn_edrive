using Nekretnine.DAO;
using Nekretnine.DAO.DAOImpl;
using Nekretnine.Model;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace Nekretnine.Service
{
    public class LiceService
    {
        private static readonly ILiceDao liceDao = new LiceDaoImpl();

        public int Count()
        {
            return liceDao.Count();
        }

        public void Delete(Lice entity)
        {
            liceDao.Delete(entity);
        }

        public void DeleteAll()
        {
            liceDao.DeleteAll();
        }

        public void DeleteById(string id)
        {
            liceDao.DeleteById(id);
        }

        public bool ExistsById(string id)
        {
            return liceDao.ExistsById(id);
        }

        public IEnumerable<Lice> FindAll()
        {
            return liceDao.FindAll().ToList();
        }

        public Lice FindById(string id)
        {
            return liceDao.FindById(id);
        }

        public void Save(Lice entity, IDbConnection konekcija)
        {
            liceDao.Save(entity, konekcija);
        }

        public void SaveAll(IEnumerable<Lice> entities)
        {
            liceDao.SaveAll(entities);
        }
    }
}
