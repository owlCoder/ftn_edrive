using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_Test.Connection
{
    public class ConnectionUtil_Pooling : IDisposable
    {
        private static IDbConnection instance = null;

        public static IDbConnection GetConnection()
        {
            if (instance == null || instance.State == System.Data.ConnectionState.Closed)
            {

                OracleConnectionStringBuilder ocsb = new OracleConnectionStringBuilder();
                ocsb.DataSource = Connection.ConnectionParams.DATA_SOURCE;
                ocsb.UserID = Connection.ConnectionParams.USER_ID;
                ocsb.Password = Connection.ConnectionParams.PASSWORD;

                ocsb.Pooling = true;
                ocsb.MinPoolSize = 1;
                ocsb.MaxPoolSize = 3;
                ocsb.IncrPoolSize = 1;
                ocsb.ConnectionLifeTime = 5;
                ocsb.ConnectionTimeout = 30;

                instance = new OracleConnection(ocsb.ConnectionString);

            }
            return instance;
        }

        public void Dispose()
        {
            if(instance != null)
            {
                instance.Close();
                instance.Dispose();
            }
        }
    }
}
