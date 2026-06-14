using Oracle.ManagedDataAccess.Client;
using System;
using System.Data;

namespace ODP_NET_example_template.Connection
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
                    // https://docs.oracle.com/database/121/ODPNT/featConnecting.htm#ODPNT163
                    ocsb.Pooling = true;
                    ocsb.MinPoolSize = 1;
                    ocsb.MaxPoolSize = 10;
                    ocsb.IncrPoolSize = 3;
                    ocsb.ConnectionLifeTime = 5;
                    ocsb.ConnectionTimeout = 30;
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

