using System.Data;

namespace Database.Interfejsi
{
    public interface IDatabaseConnection
    {
        IDbConnection GetConnection();
    }
}
