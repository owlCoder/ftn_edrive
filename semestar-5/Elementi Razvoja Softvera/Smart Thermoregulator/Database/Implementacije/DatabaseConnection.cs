using Oracle.ManagedDataAccess.Client;
using System;
using System.Data;

namespace Database.Implementacije
{
    public class DatabaseConnection : IDisposable
    {
        private static IDbConnection instance = null;

        public static IDbConnection GetConnection()
        {
            if (instance == null || instance.State == ConnectionState.Closed)
            {
                OracleConnectionStringBuilder ocsb = new OracleConnectionStringBuilder();

                ocsb.UserID = DbParams.USER_ID;
                ocsb.Password = DbParams.PASSWORD;
                ocsb.DataSource = DbParams.DATA_SOURCE;

                ocsb.Pooling = true;
                ocsb.MinPoolSize = 1;
                ocsb.MaxPoolSize = 3;

                instance = new OracleConnection(ocsb.ConnectionString);
            }
            return instance;
        }

        public void Dispose()
        {
            if (instance != null)
            {
                instance.Close();
                instance.Dispose();
            }
        }

        public static bool GetInstance()
        {
            return instance != null;
        }
    }
}
