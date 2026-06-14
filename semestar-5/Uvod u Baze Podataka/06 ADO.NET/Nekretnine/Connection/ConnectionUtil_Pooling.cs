using Oracle.ManagedDataAccess.Client;
using System;
using System.Data;

namespace Nekretnine.Connection
{
    public class ConnectionUtil_Pooling : IDisposable
    {
        private static IDbConnection instance = null;

        public static IDbConnection GetConnection()
        {
            if (instance == null || instance.State == System.Data.ConnectionState.Closed)
            {
                OracleConnectionStringBuilder ocsb = new OracleConnectionStringBuilder();

                ocsb.UserID = ConnectionParams.USER_ID;
                ocsb.Password = ConnectionParams.PASSWORD;
                ocsb.DataSource = ConnectionParams.DATA_SOURCE;

                ocsb.Pooling = true;
                ocsb.MinPoolSize = 1;
                ocsb.MaxPoolSize = 3;
                // ocsb.IncrPoolSize = 1;
                ocsb.StatementCacheSize = 150;

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
    }
}

