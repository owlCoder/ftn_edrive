using Common;
using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.Threading;

namespace Replicator
{
    class Program
    {
        static void Main(string[] args)
        {
            DateTime time = DateTime.Now;
            Console.WriteLine("Replikator servis pocinje sa radom...");

            while (true)
            {
                ChannelFactory<IReplikator> izvor = new ChannelFactory<IReplikator>("Izvor");
                ChannelFactory<IReplikator> odrediste = new ChannelFactory<IReplikator>("Odrediste");

                IReplikator proxyIzvor = izvor.CreateChannel();
                IReplikator proxyOdrediste = odrediste.CreateChannel();

                List<Student> studenti = proxyIzvor.Preuzmi(time);
                time = DateTime.Now;
                proxyOdrediste.Posalji(studenti);

                Thread.Sleep(4000);
            }
        }
    }
}
