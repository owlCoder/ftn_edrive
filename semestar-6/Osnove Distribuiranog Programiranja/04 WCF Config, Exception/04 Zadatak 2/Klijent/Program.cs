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

            try
            { 
                kanal.DodajLice(new FizickoLice(0803996800033, "Marko", "Markovic"));
            }
            catch (FaultException<ServisFizickaLicaIzuzetak> iz)
            {
                Console.WriteLine(iz.Detail.Razlog);
            }

            // EXCEPCTED EXCEPTION: ALREADY EXIST
            try
            { 
                kanal.DodajLice(new FizickoLice(0803996800033, "Marko", "Markovic"));
            }
            catch (FaultException<ServisFizickaLicaIzuzetak> iz)
            {
                Console.WriteLine(iz.Detail.Razlog);
            }

            try 
            { 
                kanal.DodajLice(new FizickoLice(1503996800033, "Petar", "Petrovic"));
            }
            catch (FaultException<ServisFizickaLicaIzuzetak> iz)
            {
                Console.WriteLine(iz.Detail.Razlog);
            }

            try
            { 
                kanal.ObrisiLice(1503996800033);
            }
            catch (FaultException<ServisFizickaLicaIzuzetak> iz)
            {
                Console.WriteLine(iz.Detail.Razlog);
            }

            // EXCEPCTED EXCEPTION: ALREADY EXIST
            try
            {
                kanal.ObrisiLice(1503996800033);
            }
            catch (FaultException<ServisFizickaLicaIzuzetak> iz)
            {
                Console.WriteLine(iz.Detail.Razlog);
            }

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
