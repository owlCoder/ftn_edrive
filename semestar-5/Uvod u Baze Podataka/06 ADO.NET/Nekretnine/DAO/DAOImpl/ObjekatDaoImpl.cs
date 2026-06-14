using Nekretnine.DTO;
using Nekretnine.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nekretnine.DAO.DAOImpl
{
    public class ObjekatDaoImpl : IObjekat
    {
        public int Count()
        {
            throw new NotImplementedException();
        }

        public void Delete(Objekat entity)
        {
            throw new NotImplementedException();
        }

        public void DeleteAll()
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

        public IEnumerable<Objekat> FindAll()
        {
            throw new NotImplementedException();
        }

        public Objekat FindById(int id)
        {
            throw new NotImplementedException();
        }

        public void Save(Objekat entity, IDbConnection konekcija)
        {
            throw new NotImplementedException();
        }

        public void SaveAll(IEnumerable<Objekat> entities)
        {
            throw new NotImplementedException();
        }

        // metoda koja pronalazi sve objekte na osnovu prosledjenog IDVO
        public List<Objekat> PronadjiObjekteZaIdvo(int idvo) 
        {
            List<Objekat> objekti = new List<Objekat>();

            string upit = "SELECT *FROM OBJEKAT WHERE IDVO = :idvo";

            using(IDbConnection konekcija = Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                using(IDbCommand komanda = konekcija.CreateCommand()) 
                {
                    komanda.CommandText = upit;

                    Utils.ParameterUtil.AddParameter(komanda, "idvo", DbType.Int32);
                    komanda.Prepare();
                    Utils.ParameterUtil.SetParameterValue(komanda, "idvo", idvo);

                    using(IDataReader reader = komanda.ExecuteReader()) 
                    {
                        while(reader.Read()) 
                        {
                            int ido = reader.GetInt32(0);
                            string idl = reader.GetString(1);
                            int idv = reader.GetInt32(2);
                            double povrsina = reader.GetDouble(3);
                            string adresa = reader.GetString(4);
                            double vrednost = reader.GetDouble(5);

                            Objekat novi = new Objekat(ido, idl, idv, povrsina, adresa, vrednost);
                            objekti.Add(novi);
                        }
                    }
                }
            }

            return objekti;
        }

        // metoda koja racuna ukupnu vrednost za dati idvo (tip objekta)
        public double UkupnaVrednostObjektaIdvo(int idvo)
        {
            double suma = 0.0;

            List<Objekat> objekti = PronadjiObjekteZaIdvo(idvo);

            foreach(Objekat trenutni in objekti) 
            {
                suma += trenutni.Vrednost;
            }

            return suma;
        }

        


        // II NACIN: koriscenje DTO
        public TipObjektaUkupnaVrednostDTO PronadjiObjekteIUkupnuVrednost(int idvo)
        {
            // tu nam se sada nalazi lista svih objekata i jedno polje za ukupnu vrednost
            TipObjektaUkupnaVrednostDTO sviObjektiIUkupnaVrednost = new TipObjektaUkupnaVrednostDTO();

            string upit = "SELECT *FROM OBJEKAT WHERE IDVO = :idvo";

            using (IDbConnection konekcija = Connection.ConnectionUtil_Pooling.GetConnection())
            {
                konekcija.Open();

                using (IDbCommand komanda = konekcija.CreateCommand())
                {
                    komanda.CommandText = upit;

                    Utils.ParameterUtil.AddParameter(komanda, "idvo", DbType.Int32);
                    komanda.Prepare();
                    Utils.ParameterUtil.SetParameterValue(komanda, "idvo", idvo);

                    using (IDataReader reader = komanda.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            int ido = reader.GetInt32(0);
                            string idl = reader.GetString(1);
                            int idv = reader.GetInt32(2);
                            double povrsina = reader.GetDouble(3);
                            string adresa = reader.GetString(4);
                            double vrednost = reader.GetDouble(5);

                            Objekat novi = new Objekat(ido, idl, idv, povrsina, adresa, vrednost);
                            sviObjektiIUkupnaVrednost.Objekti.Add(novi); // u listu objekata u klasi dto
                            // dodajemo novi objekat
                            // i sada je potrebno da ukupnu vrednost uvecamo za trenutnu vrednost objekta
                            sviObjektiIUkupnaVrednost.UkupnaVrednost += vrednost;
                        }
                    }
                }
            }

            return sviObjektiIUkupnaVrednost; // ovde vracamo samo jedan dto a ne listu
            // jer sam DTO u sebi ima listu objekata!
        }
    }
}
