using ODP_NET_example_template.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_example_template.DAO.DAOImpl
{
    public class PrevoznikDaoImpl : IPrevoznik
    {
        public int Count()
        {
            string upit = "SELECT COUNT(*) FROM Prevoznik";

            using (IDbConnection konekcija = ODP_NET_Test.Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                using (IDbCommand komanda = konekcija.CreateCommand())
                {
                    komanda.CommandText = upit;
                    komanda.Prepare();

                    return Convert.ToInt32(komanda.ExecuteScalar());
                }
            }
        }

        public void DeleteById(string id)
        {
            string upit = "DELETE FROM Prevoznik WHERE idp = :id";

            using (IDbConnection konekcija = ODP_NET_Test.Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                using (IDbCommand komanda = konekcija.CreateCommand())
                {
                    komanda.CommandText = upit;

                    ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "id", DbType.String, 2);
                    komanda.Prepare();
                    ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "id", id);

                    komanda.ExecuteNonQuery();
                }
            }
        }

        public bool ExistsById(string id)
        {
            string upit = "SELECT *FROM Prevoznik WHERE idp = :id";

            using (IDbConnection konekcija = ODP_NET_Test.Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                using (IDbCommand komanda = konekcija.CreateCommand())
                {
                    komanda.CommandText = upit;

                    ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "id", DbType.String, 2);
                    komanda.Prepare();
                    ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "id", id);

                    return komanda.ExecuteScalar() != null;
                }
            }
        }

        public IEnumerable<Prevoznik> FindAll()
        {
            string upit = "SELECT *FROM Prevoznik";

            List<Prevoznik> lista = new List<Prevoznik>();

            using (IDbConnection konekcija = ODP_NET_Test.Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                using (IDbCommand komanda = konekcija.CreateCommand())
                {
                    komanda.CommandText = upit;
                    komanda.Prepare();

                    using (IDataReader reader = komanda.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string idp = reader.GetString(0);
                            string nazivp = reader.GetString(1);
                            string gradp = reader.IsDBNull(2) == true ? "" : reader.GetString(2);
                            int brAvFlt =  reader.IsDBNull(3) == true ? 0  : reader.GetInt32(3);

                            // (string idp, string nazivp, string gradp, int brAvFlt)
                            Prevoznik v = new Prevoznik(idp, nazivp, gradp, brAvFlt);
                            lista.Add(v);
                        }
                    }
                }
            }

            return lista;
        }

        public Prevoznik FindById(string id)
        {
            Prevoznik v = null;
            string upit = "SELECT *FROM Prevoznik WHERE idp = :id";

            using (IDbConnection konekcija = ODP_NET_Test.Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                using (IDbCommand komanda = konekcija.CreateCommand())
                {
                    komanda.CommandText = upit;

                    ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "id", DbType.String, 2);
                    komanda.Prepare();
                    ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "id", id);

                    using (IDataReader reader = komanda.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string idp = reader.GetString(0);
                            string nazivp = reader.GetString(1);
                            string gradp = reader.IsDBNull(2) == true ? "" : reader.GetString(2);
                            int brAvFlt = reader.IsDBNull(3) == true ? 0 : reader.GetInt32(3);

                            // (string idp, string nazivp, string gradp, int brAvFlt)
                            v = new Prevoznik(idp, nazivp, gradp, brAvFlt);
                        }
                    }
                }
            }

            return v;
        }

        public void Save(Prevoznik entity)
        {
            string insert = "INSERT INTO Prevoznik (nazivp, gradp, brAvFlt, idp) " +
                                       "VALUES(:nazivp, :gradp, :brAvFlt, :idp)";

            string update = "UPDATE Prevoznik SET nazivp = :nazivp, gradp = :gradp, brAvFlt = :brAvFlt " +
                                    "WHERE idp = :idp";

            string upit;

            if (ExistsById(entity.Idp))
            {
                upit = update;
            }
            else
            {
                upit = insert;
            }

            using (IDbConnection konekcija = ODP_NET_Test.Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                using (IDbCommand komanda = konekcija.CreateCommand())
                {
                    komanda.CommandText = upit;

                    ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "nazivp", DbType.String, 128);
                    ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "gradp", DbType.String, 2);
                    ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "brAvFlt", DbType.Int32);
                    ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "idp", DbType.String, 2);

                    komanda.Prepare();

                    ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "nazivp", entity.Nazivp);
                    ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "gradp", entity.Gradp);
                    ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "brAvFlt", entity.BrAvFlt);
                    ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "idp", entity.Idp);

                    komanda.ExecuteNonQuery();
                }
            }
        }
    }
}
