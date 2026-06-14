using Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;

namespace Klijent
{
    class Program
    {
        static void Main(string[] args)
        {
            EndpointAddress EPRemote = new EndpointAddress("net.tcp://localhost:8005/IFizickaLica");
            using (ChannelFactory<IFizickaLica> factory = new ChannelFactory<IFizickaLica>(new NetTcpBinding(), EPRemote))
            {
                IFizickaLica kanal = factory.CreateChannel();

                kanal.DodajLice(0803996800033, "Marko", "Markovic");
                kanal.DodajLice(1503996800033, "Petar", "Petrovic");

                Console.WriteLine(Lice.GetHeader());
                Console.WriteLine("-------------------------------------------------------");
                Console.WriteLine(kanal.SpisakLica());

                kanal.ObrisiLice(1503996800033);
                Console.WriteLine(Lice.GetHeader());
                Console.WriteLine("-------------------------------------------------------");
                Console.WriteLine(kanal.SpisakLica());

                Console.WriteLine("Pritisnite [Enter] za zaustavljanje klijenta.");
                Console.ReadLine();
            }
        }
    }
}
