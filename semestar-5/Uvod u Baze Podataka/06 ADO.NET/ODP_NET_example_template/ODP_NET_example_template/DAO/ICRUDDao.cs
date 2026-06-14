using System.Collections.Generic;

namespace ODP_NET_example_template.DAO
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

        void Save(T entity);

        void SaveAll(IEnumerable<T> entities);

    }
}