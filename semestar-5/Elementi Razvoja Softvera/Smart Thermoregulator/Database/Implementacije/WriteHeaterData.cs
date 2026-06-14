using Database.Interfejsi;
using System.Data;

namespace Database.Implementacije
{
    public class WriteHeaterData : IWriteHeaterData
    {
        public bool Evidencija(int radioSati, string datum, decimal potrosenoKw)
        {
            using (IDbConnection konekcija = DatabaseConnection.GetConnection())
            {
                konekcija.Open();

                using (IDbCommand komanda = konekcija.CreateCommand())
                {
                    komanda.CommandText = "INSERT INTO HEATER VALUES(" + radioSati + ", '" + datum + "'," + potrosenoKw + ")";
                    komanda.Prepare();

                    return komanda.ExecuteNonQuery() != 0;
                }
            }
        }
    }
}
