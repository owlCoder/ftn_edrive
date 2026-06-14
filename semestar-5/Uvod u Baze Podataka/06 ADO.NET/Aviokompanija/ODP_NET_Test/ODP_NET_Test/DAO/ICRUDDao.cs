using System.Collections.Generic;

namespace ODP_NET_Test.DAO
{
	public interface ICRUDDao<T, ID>
	{
		int Count();

		void DeleteById(ID id);

		bool ExistsById(ID id);

		IEnumerable<T> FindAll();

		T FindById(ID id);

		void Save(T entity);

	}
}