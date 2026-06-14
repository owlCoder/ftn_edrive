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
            bool isFirstTime = true;
            DateTime time = DateTime.Now;
            while (true)
            {
                try
                {
                    ChannelFactory<IFizickaLica> cfIzvor = new ChannelFactory<IFizickaLica>("Izvor");
                    ChannelFactory<IFizickaLica> cfOdrediste = new ChannelFactory<IFizickaLica>("Odrediste");
                    IFizickaLica kIzvor = cfIzvor.CreateChannel();
                    IFizickaLica kOdrediste = cfOdrediste.CreateChannel();

                    if (isFirstTime)
                    {
                        kOdrediste.UpisLica(kIzvor.SpisakLica()); // kad prvi put radimo replikaciju moramo da pokupimo sve sto se tamo nalazi
                        time = DateTime.Now; // moramo da zabelezimo vreme kada smo poslednji put odradili izmenu
                        isFirstTime = false;
                    }
                    else
                    {
                        List<FizickoLice> lica = kIzvor.OcitavanjeLica(time);
                        time = DateTime.Now; // moramo da zabelezimo vreme kada smo poslednji put odradili izmenu
                        kOdrediste.UpisLica(lica);
                    }
                    
                    Thread.Sleep(5000);
                }
                catch (FaultException<ServisFizickaLicaIzuzetak> ex)
                {
                    Console.WriteLine(ex.Detail.Razlog);
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.Message);
                }
            }
        }
    }
}
