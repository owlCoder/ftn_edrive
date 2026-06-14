using Nekretnine.Model;
using System;
using System.Collections.Generic;
using System.Data;

namespace Nekretnine.DAO.DAOImpl
{
    public class LiceDaoImpl : ILiceDao
    {
        public int Count()
        {
            string upit = "SELECT COUNT(*) FROM LICE";

            using (IDbConnection konekcija = Connection.ConnectionUtil_Pooling.GetConnection())
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

        public void Delete(Lice entity)
        {
            DeleteById(entity.Idl);
        }

        public void DeleteAll()
        {
            string upit = "DELETE FROM LICE";

            using (IDbConnection konekcija = Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                using (IDbCommand komanda = konekcija.CreateCommand())
                {
                    komanda.CommandText = upit;
                    komanda.Prepare();

                    komanda.ExecuteNonQuery();
                }
            }
        }

        public void DeleteById(string id)
        {
            string upit = "DELETE FROM LICE WHERE idl = :id";

            using (IDbConnection konekcija = Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                using (IDbCommand komanda = konekcija.CreateCommand())
                {
                    komanda.CommandText = upit;

                    Utils.ParameterUtil.AddParameter(komanda, "id", DbType.String, 8);
                    komanda.Prepare();
                    Utils.ParameterUtil.SetParameterValue(komanda, "id", id);

                    komanda.ExecuteNonQuery();
                }
            }
        }

        public bool ExistsById(string id)
        {
            string upit = "SELECT *FROM LICE WHERE idl = :id";

            using (IDbConnection konekcija = Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                using (IDbCommand komanda = konekcija.CreateCommand())
                {
                    komanda.CommandText = upit;

                    Utils.ParameterUtil.AddParameter(komanda, "id", DbType.String, 8);
                    komanda.Prepare();
                    Utils.ParameterUtil.SetParameterValue(komanda, "id", id);

                    return komanda.ExecuteScalar() != null;
                }
            }
        }

        public IEnumerable<Lice> FindAll()
        {
            string upit = "SELECT *FROM LICE";

            List<Lice> lista = new List<Lice>();

            using (IDbConnection konekcija = Connection.ConnectionUtil_Pooling.GetConnection())
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
                            string idl = reader.GetString(0);
                            string imel = reader.GetString(1);
                            string przl = reader.GetString(2);
                            string vrstal = reader.GetString(3);
                            double mesprih = reader.GetDouble(4);

                            Lice lice = new Lice(idl, imel, przl, vrstal, mesprih);
                            lista.Add(lice);
                        }
                    }
                }
            }

            return lista;
        }

        public Lice FindById(string id)
        {
            string upit = "SELECT *FROM LICE WHERE idl = :id";

            Lice lice = null;

            using (IDbConnection konekcija = Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                using (IDbCommand komanda = konekcija.CreateCommand())
                {
                    komanda.CommandText = upit;

                    Utils.ParameterUtil.AddParameter(komanda, "id", DbType.String, 8);
                    komanda.Prepare();
                    Utils.ParameterUtil.SetParameterValue(komanda, "id", id);

                    using (IDataReader reader = komanda.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string idl = reader.GetString(0);
                            string imel = reader.GetString(1);
                            string przl = reader.GetString(2);
                            string vrstal = reader.GetString(3);
                            double mesprih = reader.GetDouble(4);

                            lice = new Lice(idl, imel, przl, vrstal, mesprih);
                        }
                    }
                }
            }

            return lice;
        }

        public void Save(Lice entity, IDbConnection konekcija)
        {
            string insert = "INSERT INTO LICE (imel, przl, vrstal, mes_prihodil, idl) " +
                                       "VALUES(:ime, :prz, :vrsta, :prihodi, :idl)";

            string update = "UPDATE LICE SET imel = :ime, przl = :prz, vrstal = :vrsta, mes_prihodil = :prihodi " +
                                    "WHERE idl = :idl";

            string upit;

            if (ExistsById(entity.Idl))
            {
                upit = update;
            }
            else
            {
                upit = insert;
            }

            using (IDbCommand komanda = konekcija.CreateCommand())
            {
                komanda.CommandText = upit;

                Utils.ParameterUtil.AddParameter(komanda, "ime", DbType.String, 20);
                Utils.ParameterUtil.AddParameter(komanda, "prz", DbType.String, 20);
                Utils.ParameterUtil.AddParameter(komanda, "vrsta", DbType.String, 12);
                Utils.ParameterUtil.AddParameter(komanda, "prihodi", DbType.Decimal);
                Utils.ParameterUtil.AddParameter(komanda, "idl", DbType.String, 20);

                komanda.Prepare();

                Utils.ParameterUtil.SetParameterValue(komanda, "ime", entity.ImeL);
                Utils.ParameterUtil.SetParameterValue(komanda, "prz", entity.Przl);
                Utils.ParameterUtil.SetParameterValue(komanda, "vrsta", entity.Vrstal);
                Utils.ParameterUtil.SetParameterValue(komanda, "prihodi", entity.Mes_prihodil);
                Utils.ParameterUtil.SetParameterValue(komanda, "idl", entity.Idl);

                komanda.ExecuteNonQuery();
            }
        }

        public void SaveAll(IEnumerable<Lice> entities)
        {
            using (IDbConnection konekcija = Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                IDbTransaction transakcija = konekcija.BeginTransaction();

                foreach (Lice entity in entities)
                {
                    Save(entity, konekcija);
                }

                transakcija.Commit();
            }
        }
    }
}
