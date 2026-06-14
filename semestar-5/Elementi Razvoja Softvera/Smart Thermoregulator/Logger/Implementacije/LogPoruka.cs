using System;

namespace Logger
{
    public class LogPoruka
    {
        private string poruka;

        public LogPoruka(string por)
        {
            if (por == null)
                throw new ArgumentNullException();

            if (por.Trim().Length == 0)
                throw new ArgumentException();

            poruka = por;
        }

        public string GetInfoMessage()
        {
            return string.Format("[INFO] [{0}] {1}", DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss"), poruka);
        }

        public string GetWarnMessage()
        {
            return string.Format("[WARN] [{0}] {1}", DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss"), poruka);
        }

        public string GetErrorMessage()
        {
            return string.Format("[ERROR] [{0}] {1}", DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss"), poruka);
        }
    }
}
