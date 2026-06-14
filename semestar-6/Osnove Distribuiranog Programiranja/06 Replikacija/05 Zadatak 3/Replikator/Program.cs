using Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Replikator
{
    class Program
    {
        static void Main(string[] args)
        {
            while (true)
            {
                try
                {
                    ChannelFactory<IFizickaLica> cfIzvor = new ChannelFactory<IFizickaLica>("Izvor");
                    ChannelFactory<IFizickaLica> cfOdrediste = new ChannelFactory<IFizickaLica>("Odrediste");

                    IFizickaLica kIzvor = cfIzvor.CreateChannel();
                    IFizickaLica kOdrediste = cfOdrediste.CreateChannel();

                    kOdrediste.UpisLica(kIzvor.OcitavanjeLica());
                    Thread.Sleep(5000);
                }
                catch (FaultException<ServisFizickihLicaIzuzetak> ex)
                {
                    Console.WriteLine(ex.Detail.Razlog);
                }
            }

        }
    }
}
