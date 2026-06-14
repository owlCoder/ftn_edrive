namespace Database.Interfejsi
{
    public interface IWriteHeaterData
    {
        bool Evidencija(int radioSati, string datum, decimal potrosenoKw);
    }
}
