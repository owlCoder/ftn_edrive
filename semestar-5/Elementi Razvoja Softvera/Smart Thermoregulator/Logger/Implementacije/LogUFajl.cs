///      Klasa LogUFajl
///      Na osnovu ime_log_datoteke (polje u klasi) upisuje
///      tj. dodaje prosledjenu poruku na kraj log datoteke

using System;
using System.IO;

namespace Logger
{
    public class LogUFajl
    {
        private string ime_log_datoteke = "log.txt";

        public LogUFajl(string ime_datoteke = "log.txt")
        {
            // izuzetak jer ime datoteke ne moze biti null
            if (ime_log_datoteke == null)
            {
                throw new ArgumentNullException();
            }

            // izuzetak jer ime datoteke ne moze biti prazan string
            if (ime_log_datoteke.Trim().Length == 0)
            {
                throw new ArgumentException();
            }

            // ako prosledjeni string nije null i nije prazan onda podesiti polje
            ime_log_datoteke = ime_datoteke;
        }

        public void UpisULogDatoteku(string poruka)
        {
            using (StreamWriter writer = new StreamWriter(ime_log_datoteke, true))
            {
                // dodavanje poruke na kraj datoteke za belezenje poruka
                writer.WriteLine(poruka);
            }
        }

    }
}
