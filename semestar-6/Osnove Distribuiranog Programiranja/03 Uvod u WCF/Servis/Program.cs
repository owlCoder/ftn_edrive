using Common;
using System;
using System.ServiceModel;

namespace Servis
{
    class Program
    {
        static void Main()
        {
            using (ServiceHost svc = new ServiceHost(typeof(FizickaLica)))
            {
                Uri adresa = new Uri("net.tcp://localhost:8005/IFizickaLica");
                svc.AddServiceEndpoint(typeof(IFizickaLica), new NetTcpBinding(), adresa);
                svc.Open();

                Console.WriteLine("Servis za rad sa fizickim licima je aktivan!\n");
                Console.WriteLine("Pritisnite [Enter] za zaustavljanje servisa.");
                Console.ReadLine();
            }
        }
    }
}
