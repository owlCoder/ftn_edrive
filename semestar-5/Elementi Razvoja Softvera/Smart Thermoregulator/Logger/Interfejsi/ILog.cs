///         INTERFACE ILog
///         Belezenje nove poruke
///         
namespace Logger.Interfejsi
{
    public interface ILog
    {
        // metoda koja sluzi za belezenje informacionih poruka
        void LogNoveInformationPoruke();

        // metoda koja sluzi za belezenje poruka o upozorenju
        void LogNoveWarningPoruke();

        // metoda koja sluzi za belezenje poruka o gresci
        void LogNoveErrorPoruke();
    }
}
