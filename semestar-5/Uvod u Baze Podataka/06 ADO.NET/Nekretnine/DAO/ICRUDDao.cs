using System.Collections.Generic;
using System.Data;

namespace Nekretnine.DAO
{
    public interface ICRUDDao<T, ID>
    {
        int Count();

        void Delete(T entity);

        void DeleteAll();

        void DeleteById(ID id);

        bool ExistsById(ID id);

        IEnumerable<T> FindAll();

        T FindById(ID id);

        void Save(T entity, IDbConnection konekcija);

        void SaveAll(IEnumerable<T> entities);

    }
}