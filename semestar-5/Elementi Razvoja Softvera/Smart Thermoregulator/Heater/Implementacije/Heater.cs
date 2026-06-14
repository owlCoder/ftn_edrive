using Database.Implementacije;
using Database.Interfejsi;
using Heater.Interfejsi;
using Logger;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;

namespace Heater
{
    public class Heater : IHeater
    {
        public bool IsHeaterOn { get; set; }
        public List<Device.Device> devices { get; set; }

        Stopwatch ProtekloVreme { get; set; }

        public Heater()
        {
            IsHeaterOn = false;
            ProtekloVreme = new Stopwatch();
        }
        public void PokreniZagrevanje()
        {
            if (IsHeaterOn) // ako je izdata komanda za paljenje grejaca
            {
                ProtekloVreme.Start(); // pokreni brojanje koliko je grejac radio

                var prosecna = 0.0;
                foreach (Device.Device d in devices)
                {
                    d.Temperatura += 5.01;
                    prosecna += d.Temperatura;

                    // log u fajl
                    string r = string.Format("Uredjaj [{0}]: Temperatura: {1}°C", d.DeviceId, d.Temperatura);
                    Log l = new Log(r);
                    l.LogNoveInformationPoruke();
                }

                // log u fajl
                string str = string.Format("Prosecna temperatura: {0}°C", prosecna / devices.Count);
                Log log = new Log(str);
                log.LogNoveInformationPoruke();
            }
            else
            {
                ProtekloVreme.Stop(); // zaustavi rad i upisi u evidenciju
                Evidencija();
                IsHeaterOn = false;
                ProtekloVreme.Reset(); // ponovno brojanje od nule
            }
        }

        // TODO LOG U BAZU PODATAKA
        public void Evidencija()
        {
            try
            {
                IWriteHeaterData belezenjePodataka = new WriteHeaterData();

                var ts = ProtekloVreme.Elapsed;
                int proteklo = ts.Milliseconds;
                string datum = DateTime.Now.ToString("dd.MM.yyyy HH:mm:ss");
                decimal potroseno = (proteklo * 12); // 12.5W po sekundi

                belezenjePodataka.Evidencija(proteklo, datum, potroseno);
            }
            catch (Exception)
            {
                // catch Exception
            }
        }
    }
}
