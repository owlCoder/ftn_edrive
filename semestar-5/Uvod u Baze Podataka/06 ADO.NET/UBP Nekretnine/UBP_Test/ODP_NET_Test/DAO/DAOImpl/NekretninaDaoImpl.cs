using ODP_NET_example_template.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_example_template.DAO.DAOImpl
{
    public class NekretninaDaoImpl : INekretninaDao
    {
        public int SpecCount(string idv)
        {
            string upit = "select count(*) from NEKRETNINA where idv = '" + idv + "'";

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

        public double SpecSaldo(string idv)
        {
            string upit = "select sum(saldo) from poreskakartica where idv = '" + idv + "'";

            using (IDbConnection konekcija = ODP_NET_Test.Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                using (IDbCommand komanda = konekcija.CreateCommand())
                {
                    komanda.CommandText = upit;
                    komanda.Prepare();

                    return Convert.ToDouble(komanda.ExecuteScalar());
                }
            }
        }

        public List<Nekretnina> SpecNekretnina(string idv)
        {
            List<Nekretnina> nekretninas = new List<Nekretnina>();

            string upit = "select *from nekretnina where idv = '" + idv + "'";

            using (IDbConnection konekcija = ODP_NET_Test.Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                using (IDbCommand komanda = konekcija.CreateCommand())
                {
                    komanda.CommandText = upit;
                    komanda.Prepare();

                    using(IDataReader reader = komanda.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            int brst = reader.IsDBNull(5) == true ? 0 : reader.GetInt32(5);
                            nekretninas.Add(new Nekretnina(reader.GetInt32(0), reader.GetString(1),
                                                           reader.GetFloat(2), reader.GetString(3),
                                                           reader.GetInt32(4), brst, reader.GetString(6),
                                                           reader.GetInt32(7)));
                        }
                    }
                }
            }

            return nekretninas;
        }

        public List<Nekretnina> KvdVecaOd(float kvd)
        {
            List<Nekretnina> nekretninas = new List<Nekretnina>();

            string upit = "SELECT *FROM NEKRETNINA WHERE kvd > :kvd_uneto";

            using (IDbConnection konekcija = ODP_NET_Test.Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                using (IDbCommand komanda = konekcija.CreateCommand())
                {
                    komanda.CommandText = upit;

                    ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "kvd_uneto", DbType.Decimal);
                    komanda.Prepare();
                    ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "kvd_uneto", kvd);

                    using(IDataReader reader = komanda.ExecuteReader()) 
                    {
                        while (reader.Read())
                        {
                            int brst = reader.IsDBNull(5) == true ? 0 : reader.GetInt32(5);
                            nekretninas.Add(new Nekretnina(reader.GetInt32(0), reader.GetString(1),
                                                           reader.GetFloat(2), reader.GetString(3),
                                                           reader.GetInt32(4), brst, reader.GetString(6),
                                                           reader.GetInt32(7)));
                        }                   
                    }
                }
            }

            return nekretninas;
        }

        public void Transakcija(int idn, int brnek)
        {
            string upit_a = "UPDATE NEKRETNINA SET brnek = brnek + :brnek " +
                            "WHERE idn = :idn";

            string upit_b = "UPDATE PORESKAKARTICA SET SALDO = SALDO + :plusminussto " +
                            "WHERE idv = :idv";

            string get_idv = "SELECT IDV FROM NEKRETNINA WHERE idn = " + idn;
            
            float plusminussto;

            if (brnek < 0)
            {
                plusminussto = -100;
            }
            else
            {
                plusminussto = 100;
            }

            using (IDbConnection konekcija = ODP_NET_Test.Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                // pocetak transakcije
                IDbTransaction transaction = konekcija.BeginTransaction();

                try
                {
                    // get idv
                    string idv;
                    using (IDbCommand komanda = konekcija.CreateCommand())
                    {
                        komanda.CommandText = get_idv;
                        komanda.Prepare();
                        
                        idv = Convert.ToString(komanda.ExecuteScalar());
                    }

                    using (IDbCommand komanda = konekcija.CreateCommand())
                    {
                        komanda.CommandText = upit_a;
                        ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "brnek", DbType.Int32);
                        ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "idn", DbType.Int32);
                        komanda.Prepare();
                        ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "brnek", brnek);
                        ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "idn", idn);

                        komanda.ExecuteNonQuery();
                    }

                    using (IDbCommand komanda = konekcija.CreateCommand())
                    {
                        komanda.CommandText = upit_b;
                        ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "plusminussto", DbType.Decimal);
                        ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "idv", DbType.String, 8);
                        komanda.Prepare();
                        ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "plusminussto", plusminussto);
                        ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "idv", idv);

                        komanda.ExecuteNonQuery();
                    }

                    // kraj transakcije
                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    throw ex;
                }

            }
        }

        public int Count()
        {
            throw new NotImplementedException();
        }

        public void DeleteById(int id)
        {
            throw new NotImplementedException();
        }

        public bool ExistsById(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Nekretnina> FindAll()
        {
            throw new NotImplementedException();
        }

        public Nekretnina FindById(int id)
        {
            throw new NotImplementedException();
        }

        public void Save(Nekretnina entity)
        {
            throw new NotImplementedException();
        }
    }
}
