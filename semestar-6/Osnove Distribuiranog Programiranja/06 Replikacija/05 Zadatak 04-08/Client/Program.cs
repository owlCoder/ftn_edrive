using Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Client
{
    class Program
    {
        static void Main(string[] args)
        {
            ChannelFactory<IFizickaLica> servislica = new ChannelFactory<IFizickaLica>("ServisLica");
            

            int cnt = 0;

            while (true)
            {
                try
                {
                    IFizickaLica kanalB = servislica.CreateChannel();

                    try
                    {
                        kanalB.DodajLice(new FizickoLice(1803996800033 + cnt, $"Marko + {++cnt}", "Markovic", DateTime.Now));
                    }
                    catch (FaultException<ServisFizickaLicaIzuzetak> ex)
                    {
                        Console.WriteLine(ex.Detail.Razlog);
                    }


                    try
                    {
                        kanalB.IzmeniLice(new FizickoLice(1803996800033, "Marko" + (cnt).ToString(), "Markovic" + cnt.ToString(), DateTime.Now));
                    }
                    catch (FaultException<ServisFizickaLicaIzuzetak> ex)
                    {
                        Console.WriteLine(ex.Detail.Razlog);
                    }

                }
                catch (Exception e)
                {
                    Console.WriteLine(e.Message);
                }
                Thread.Sleep(3000);

            
            }          

        }
    }
}
