using Logger.Interfejsi;
using System;

namespace Logger
{
    public class Log : ILog
    {
        private string poruka_za_upis;
        LogPoruka logPoruka = null;
        LogUFajl logUFajl = null;

        public Log(string poruka)
        {
            if (poruka == null)
                throw new ArgumentNullException();

            if (poruka.Trim().Length == 0)
                throw new ArgumentException();

            poruka_za_upis = poruka;

            logPoruka = new LogPoruka(poruka);
        }

        public string Poruka_za_upis { get => poruka_za_upis; set => poruka_za_upis = value; }

        // metoda koja sluzi za belezenje informacionih poruka
        public void LogNoveErrorPoruke()
        {
            logUFajl = new LogUFajl("log.txt");
            logUFajl.UpisULogDatoteku(logPoruka.GetErrorMessage());
        }

        // metoda koja sluzi za belezenje poruka o upozorenju
        public void LogNoveInformationPoruke()
        {
            logUFajl = new LogUFajl("log.txt");
            logUFajl.UpisULogDatoteku(logPoruka.GetInfoMessage());
        }

        // metoda koja sluzi za belezenje poruka o gresci
        public void LogNoveWarningPoruke()
        {
            logUFajl = new LogUFajl("log.txt");
            logUFajl.UpisULogDatoteku(logPoruka.GetWarnMessage());
        }
    }
}
