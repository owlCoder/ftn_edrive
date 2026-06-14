using ODP_NET_example_template.DTO;
using ODP_NET_example_template.Model;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_example_template.DAO.DAOImpl
{
    public class AerodromDaoImpl : IAerodrom
    {
        public List<KompleksDTO> KompleksanIzvestaj()
        {
            List<KompleksDTO> svi = new List<KompleksDTO>();


            // svi aerodromi
            List<Aerodrom> aero = FindAll().ToList();

            // broj polazaka sa aerodroma
            foreach(Aerodrom a in aero) 
            {
                KompleksDTO novi = new KompleksDTO();
                novi.Aerodrom = new Aerodrom(a.Ida, a.Naziva, a.Grada);

                // metoda broj polazaka sa aerodroma
                int polazaka = PrebrojPolaske(a.Ida);

                // metoda broj dolazaka sa aerodroma
                int dolazaka = PrebrojDolaske(a.Ida);

                novi.Polazaka = polazaka;
                novi.Dolazaka = dolazaka;

                // SELECT idr, prev, POLAZ, ODRED, cena, VALUTA, NAZIVP from RUTA, PREVOZNIK WHERE
                // prev = idp and(POLAZ = 'BEG' OR ODRED = 'BEG')
                string upit = "SELECT idr, prev, POLAZ, ODRED, cena, VALUTA, NAZIVP from RUTA, PREVOZNIK " +
                    "WHERE prev = idp and(POLAZ = '" + a.Ida + "' OR ODRED = '" + a.Ida + "')";

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
                                string idr = reader.GetString(0);
                                string prev = reader.GetString(1);
                                string polaz = reader.GetString(2);
                                string odred = reader.GetString(3);
                                float cena = reader.IsDBNull(4) == true ? 0 : reader.GetFloat(4);
                                string valuta = reader.GetString(5);
                                string nazivp = reader.GetString(6);

                                RutaDto nova = new RutaDto(idr, prev, polaz, odred, cena, valuta, nazivp);

                                novi.RutaDtoL.Add(nova);
                            }
                        }
                    }
                }
                // cuvanje u listu
                svi.Add(novi);
            }

            return svi;
        }

        private int PrebrojDolaske(string ida)
        {
            string upit = "SELECT COUNT(*) FROM Ruta WHERE odred = '" + ida + "'";

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

        private int PrebrojPolaske(string ida)
        {
            string upit = "SELECT COUNT(*) FROM Ruta WHERE polaz = '" + ida + "'";

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

        public void Transakcija(string idp, string ida)
        {
            string upit_a = "delete from ruta where prev = :idp and polaz = :ida";

            string upit_b = "UPDATE PREVOZNIK SET BRAVFLT = BRAVFLT + :obrisanoRedova " +
                            "WHERE idp = :idp";

            int obrisanoRuta = 0;

            using (IDbConnection konekcija = ODP_NET_Test.Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                // pocetak transakcije
                IDbTransaction transaction = konekcija.BeginTransaction();

                try
                {
                    using (IDbCommand komanda = konekcija.CreateCommand())
                    {
                        komanda.CommandText = upit_a;
                        ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "idp", DbType.String, 2);
                        ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "ida", DbType.String, 3);
                        komanda.Prepare();
                        ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "idp", idp);
                        ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "ida", ida);

                        obrisanoRuta = komanda.ExecuteNonQuery();
                    }

                    using (IDbCommand komanda = konekcija.CreateCommand())
                    {
                        if (obrisanoRuta <= 5)
                            obrisanoRuta = -1;
                        else
                            obrisanoRuta = -5;

                        komanda.CommandText = upit_b;
                        ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "obrisanoRedova", DbType.Int32);
                        ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "idp", DbType.String, 2);
                        komanda.Prepare();
                        ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "obrisanoRedova", obrisanoRuta);
                        ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "idp", idp);

                        komanda.ExecuteNonQuery();
                    }

                    // kraj transakcije
                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    Console.WriteLine("Transkacija neuspesna!\n");
                    throw ex;
                }

            }
        }

        private string GetIda(string naziv_a)
        {
            string ida;

            // select ida from aerodrom where naziva = 'Nikola Tesla';
            using (IDbConnection konekcija = ODP_NET_Test.Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                using (IDbCommand komanda = konekcija.CreateCommand())
                {
                    komanda.CommandText = "select * from aerodrom where naziva LIKE :n";

                    ODP_NET_Test.Utils.ParameterUtil.AddParameter(komanda, "n", DbType.String, 128);
                    komanda.Prepare();
                    ODP_NET_Test.Utils.ParameterUtil.SetParameterValue(komanda, "n", naziv_a);

                    ida = Convert.ToString(komanda.ExecuteScalar());
                }
            }

            return ida;
        }
        public List<Ruta> LakIzvestaj(string naziv_aerodroma)
        {
            List<Ruta> rute = new List<Ruta>();

            string ida = GetIda(naziv_aerodroma);
            Console.WriteLine("IDA: ", ida);
            string upit = "SELECT *FROM RUTA WHERE POLAZ LIKE '" + ida + "' OR ODRED LIKE '" + ida + "'";

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
                            // public Ruta(string idr, string prev, string polaz,
                            // string odred, float cena, string valuta)
                            string idr = reader.GetString(0);
                            string prev = reader.GetString(1);
                            string pol = reader.GetString(2);
                            string odred = reader.GetString(3);
                            float cena = reader.IsDBNull(4) == true ? 0 : reader.GetFloat(4);
                            string valuta = reader.GetString(5);

                            Ruta ruta = new Ruta(idr, prev, pol, odred, cena, valuta);
                            rute.Add(ruta);
                        }
                    }
                }
            }

            return rute;
        }
        public int Count()
        {
            throw new NotImplementedException();
        }

        public void DeleteById(string id)
        {
            throw new NotImplementedException();
        }

        public bool ExistsById(string id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Aerodrom> FindAll()
        {
            string upit = "SELECT *FROM Aerodrom";

            List<Aerodrom> lista = new List<Aerodrom>();

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
                            string ida = reader.GetString(0);
                            string naziva = reader.GetString(1);
                            string grada = reader.IsDBNull(2) == true ? "" : reader.GetString(2);

                            Aerodrom v = new Aerodrom(ida, naziva, grada);
                            lista.Add(v);
                        }
                    }
                }
            }

            return lista;
        }

        public Aerodrom FindById(string id)
        {
            throw new NotImplementedException();
        }

        public void Save(Aerodrom entity)
        {
            throw new NotImplementedException();
        }
    }
}
