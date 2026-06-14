using ODP_NET_example_template.DAO.DAOImpl;
using ODP_NET_example_template.DTO;
using ODP_NET_example_template.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_example_template.DAO
{
    public class VlasnikDaoImpl : IVlasnikDao
    {
        public int Count()
        {
            string upit = "SELECT COUNT(*) FROM VLASNIK";

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
            string upit = "DELETE FROM VLASNIK WHERE idv = :id";

            using (IDbConnection konekcija = ODP_NET_Test.Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                using (IDbCommand komanda = konekcija.CreateCommand())
                {
                    komanda.CommandText = upit;

                    ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "id", DbType.String, 8);
                    komanda.Prepare();
                    ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "id", id);

                    komanda.ExecuteNonQuery();
                }
            }
        }

        public List<PomDto> KompleksIzvestaj()
        {
            // tmp dao
            NekretninaDaoImpl nl = new NekretninaDaoImpl();

            List<PomDto> pomDtos = new List<PomDto>();

            List<Vlasnik> sviVlasnici = FindAll().ToList();

            foreach(Vlasnik v in sviVlasnici)
            {
                string idv = v.Idv;
                int brojNek = nl.SpecCount(idv);
                double saldo = nl.SpecSaldo(idv);

                // sve nekretnine
                List<Nekretnina> sveNekr = nl.SpecNekretnina(idv);

                pomDtos.Add(new PomDto(v, brojNek, saldo, sveNekr));
            }

            return pomDtos;
        }
        public bool ExistsById(string id)
        {
            string upit = "SELECT *FROM VLASNIK WHERE idv = :id";

            using (IDbConnection konekcija = ODP_NET_Test.Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                using (IDbCommand komanda = konekcija.CreateCommand())
                {
                    komanda.CommandText = upit;

                    ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "id", DbType.String, 8);
                    komanda.Prepare();
                    ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "id", id);

                    return komanda.ExecuteScalar() != null;
                }
            }
        }

        public IEnumerable<Vlasnik> FindAll()
        {
            string upit = "SELECT *FROM VLASNIK";

            List<Vlasnik> lista = new List<Vlasnik>();

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
                            string idv = reader.GetString(0);
                            string imev = reader.GetString(1);
                            string przv = reader.GetString(2);
                            string vrstav = reader.GetString(3);

                            Vlasnik v = new Vlasnik(idv, imev, przv, vrstav);
                            lista.Add(v);
                        }
                    }
                }
            }

            return lista;
        }

        public Vlasnik FindById(string id)
        {
            Vlasnik v = null;
            string upit = "SELECT *FROM VLASNIK WHERE idv = :id";

            using (IDbConnection konekcija = ODP_NET_Test.Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                using (IDbCommand komanda = konekcija.CreateCommand())
                {
                    komanda.CommandText = upit;

                    ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "id", DbType.String, 8);
                    komanda.Prepare();
                    ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "id", id);

                    using (IDataReader reader = komanda.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string idv = reader.GetString(0);
                            string imev = reader.GetString(1);
                            string przv = reader.GetString(2);
                            string vrstav = reader.GetString(3);

                            v = new Vlasnik(idv, imev, przv, vrstav);
                        }
                    }
                }
            }

            return v;
        }

        public void Save(Vlasnik entity)
        {
            string insert = "INSERT INTO VLASNIK (imev, przv, vrstav, idv) " +
                                       "VALUES(:ime, :prz, :vrsta, :idv)";

            string update = "UPDATE VLASNIK SET imev = :ime, przv = :prz, vrstav = :vrsta " +
                                    "WHERE idv = :idv";

            string upit;

            if (ExistsById(entity.Idv))
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

                    ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "ime", DbType.String, 20);
                    ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "prz", DbType.String, 20);
                    ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "vrsta", DbType.String, 12);
                    ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "idv", DbType.String, 20);

                    komanda.Prepare();

                    ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "ime", entity.Imev);
                    ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "prz", entity.Przv);
                    ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "vrsta", entity.Vrstav);
                    ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "idv", entity.Idv);

                    komanda.ExecuteNonQuery();
                }
            }
        }
    }
}
