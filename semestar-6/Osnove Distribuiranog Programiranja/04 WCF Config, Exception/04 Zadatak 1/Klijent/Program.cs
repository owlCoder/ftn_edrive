using Common;
using System;
using System.ServiceModel;

namespace Klijent
{
    internal class Program
    {
        static void Main()
        {
            ChannelFactory<IFizickoLice> factory = new ChannelFactory<IFizickoLice>(new NetTcpBinding(), new EndpointAddress("net.tcp://localhost:4000/IFizickaLica"));
            IFizickoLice kanal = factory.CreateChannel();

            kanal.DodajLice(new FizickoLice(0803996800033, "Marko", "Markovic"));
            kanal.DodajLice(new FizickoLice(1503996800033, "Petar", "Petrovic"));
            kanal.ObrisiLice(1503996800033);

            Console.WriteLine("Spisak lica");
            foreach (FizickoLice fl in kanal.SpisakLica())
            {
                Console.WriteLine(fl);
            }

            Console.WriteLine("Pritisnite [Enter] za zaustavljanje klijenta.");
            Console.ReadLine();
        }
    }
}
