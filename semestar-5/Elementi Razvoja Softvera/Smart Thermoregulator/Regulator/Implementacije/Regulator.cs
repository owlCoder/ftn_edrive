using Heater.Interfejsi;
using Logger;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.Remoting;
using System.Threading;
using System.Threading.Tasks;

namespace Heater
{
    public class Regulator : IRegulator
    {
        private int[] port = new int[100];
        public bool IsNocniRezim { get; set; }
        public bool IsDnevniRezim { get; set; }
        public double ZeljenaDnevnaTemperatura { get; set; }
        public double ZeljenaNocnaTemperatura { get; set; }
        public double ProsecnaTemperatura { get; set; }
        public int PocetakDnevniRezim { get; set; }
        public int KrajDnevniRezim { get; set; }
        public List<Device.Device> Uredjaji { get; set; }

        public int InstanceCnt { get; set; }

        private Heater Grejac { get; set; }

        private bool isklucena = false;
        private bool ukljucena = false;

        public Regulator()
        {
            IsNocniRezim = false;
            IsDnevniRezim = false;
            ZeljenaDnevnaTemperatura = 0;
            ZeljenaNocnaTemperatura = 0;
            ProsecnaTemperatura = 0;
            InstanceCnt = 0;

            // instanciranje grejaca
            Grejac = new Heater();
        }

        public async void Regulacija()
        {
            for(int i = 0; i <= InstanceCnt; i++)
            {
                // setovanje liste uredjaja
                string strConn = "tcp://localhost:" + (8500 + port[i]).ToString() + "/Device";
                Device.Device mr = RemotingServices.Connect(typeof(Device.Device), strConn) as Device.Device;

                Uredjaji.Add(mr);
            }
            
            await ProveraRada();
        }

        private void ProsecnaTemp()
        {
            double sum = 0.0;

            foreach (Device.Device device in Uredjaji)
            {
                sum += device.Temperatura;
            }

            ProsecnaTemperatura = sum / Uredjaji.Count;
        }

        public async Task ProveraRada()
        {
            CancellationToken ct = new CancellationToken();
            TimeSpan vreme = new TimeSpan(0, 0, 5); // DRUGI PARAMETAR PROMENITI NA 2 MINUTA!!!
            Grejac.devices = Uredjaji; // prenos referenci uredjaja

            for (; !ct.IsCancellationRequested;)
            {
                await PeriodicnaProvera(vreme, ct);

                CheckTempHeater();
            }
        }

        private void CheckTempHeater()
        {
            // koji je rezim rada
            TimeSpan currentTime = DateTime.Now.TimeOfDay;
            int trenutniSat = currentTime.Hours;

            if (trenutniSat >= PocetakDnevniRezim && trenutniSat <= KrajDnevniRezim)
            {
                IsDnevniRezim = true;
                IsNocniRezim = false;
            }
            else
            {
                IsDnevniRezim = false;
                IsNocniRezim = true;
            }

            // proracun prosecne temperature
            ProsecnaTemp();

            // izdavanje komande na osnovu trenutne temperature
            if (IsDnevniRezim)
            {
                if (ProsecnaTemperatura < ZeljenaDnevnaTemperatura)
                {
                    if (!ukljucena)
                    {
                        Log log = new Log("Ukljucivanje centralne peci!");
                        log.LogNoveInformationPoruke();

                        // set na true
                        isklucena = false;
                        ukljucena = true;
                    }
    
                    // ukljucivanje grejaca
                    Grejac.IsHeaterOn = true;        
                }
                else
                {
                    if (!isklucena)
                    {
                        Log log = new Log("Centralna pec iskljucena!");
                        log.LogNoveInformationPoruke();

                        // set na true
                        ukljucena = false;
                        isklucena = true;
                    }

                    // gasenje grejaca
                    Grejac.IsHeaterOn = false;
                }
            }
            else if (IsNocniRezim)
            {
                if (ProsecnaTemperatura < ZeljenaNocnaTemperatura)
                {
                    Log log = new Log("Ukljucivanje centralne peci!");
                    log.LogNoveInformationPoruke();

                    // ukljucivanje grejaca
                    Grejac.IsHeaterOn = true;
                }
                else
                {
                    Log log = new Log("Centralna pec iskljucena!");
                    log.LogNoveInformationPoruke();

                    // gasenje grejaca
                    Grejac.IsHeaterOn = false;
                }
            }
            else
            {
                Log log = new Log("Greska sa centralnom peci!");
                log.LogNoveErrorPoruke();

                // gasenje grejaca
                Grejac.IsHeaterOn = false;
            }

            Grejac.PokreniZagrevanje(); // pokretanje grejaca
        }

        public async Task PeriodicnaProvera(TimeSpan interval, CancellationToken cancellationToken)
        {
            await Task.Delay(interval, cancellationToken);
        }
    }
}
