using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common;
using System.ServiceModel;

namespace Client
{
    class Program
    {
        static void Main()
        {

            ChannelFactory<IFizickaLica> channel = new ChannelFactory<IFizickaLica>("ServiceName");
            ChannelFactory<IBezbednosniMehanizmi> channel_auth = new ChannelFactory<IBezbednosniMehanizmi>("BezbednosniMehanizmi");

            IFizickaLica proxy = channel.CreateChannel();
            IBezbednosniMehanizmi proxy_auth = channel_auth.CreateChannel();

            string token = "";
            try
            {
                Console.Write("Unesite korisnicko ime: ");
                string korisnik = Console.ReadLine();
                Console.Write("Unesite lozinku: ");
                string lozinka = Console.ReadLine();
                token = proxy_auth.Autentifikacija(korisnik, lozinka);
            }
            catch (FaultException<BezbednosniIzuzetak> ex)
            {
                Console.WriteLine(ex.Detail.Razlog);
            }

            try
            {
                DodajLice(new FizickoLice(2803996800033, "Marko", "Markovic"), proxy, token);
                DodajLice(new FizickoLice(1604988800033, "Petar", "Petrovic"), proxy, token);
                List<FizickoLice> spisak = proxy.SpisakLica(token);

                IspisLica(proxy, token);

                proxy.ObrisiLice(1604988800033, token);
            }
            catch (FaultException<BezbednosniIzuzetak> bex)
            {
                Console.WriteLine(bex.Detail.Razlog);
            }
            catch (FaultException<ServisFizickihLicaIzuzetak> ex)
            {
                Console.WriteLine(ex.Detail.Razlog);
            }

            Console.WriteLine("Pritisnite [Enter] za zaustavljanje klijenta."); Console.ReadLine();

        }

        static void IspisLica(IFizickaLica proxy, string token)
        {
            Console.WriteLine("Spisak lica :");
            foreach (FizickoLice lice in proxy.SpisakLica(token))
            {
                Console.WriteLine(lice);
            }
        }

        static void DodajLice(FizickoLice fizickoLice, IFizickaLica proxy, string token)
        {
            try
            {
                proxy.DodajLice(fizickoLice, token);
            }
            catch (FaultException<ServisFizickihLicaIzuzetak> izuzetak)
            {
                Console.WriteLine("ERROR : " + izuzetak.Detail.Razlog);
            }

        }
    }
}
