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
        static void Main(string[] args)
        {

            ChannelFactory<IKalkulatorKompleksnihBrojeva> channel =
                new ChannelFactory<IKalkulatorKompleksnihBrojeva>("KalkulatorEndpoint");

            IKalkulatorKompleksnihBrojeva proxy = channel.CreateChannel();


            KompleksniBroj k0 = new KompleksniBroj();
            KompleksniBroj k1 = new KompleksniBroj(7, 4);
            KompleksniBroj k2 = new KompleksniBroj(1, 2);
            KompleksniBroj k3 = new KompleksniBroj(4, 4);
            KompleksniBroj k4 = new KompleksniBroj(7, 5);
            KompleksniBroj k5 = new KompleksniBroj(7, 4);

            Saberi(proxy, k1, k2);
            Oduzmi(proxy, k1, k2);
            Oduzmi(proxy, k1, k3);
            Oduzmi(proxy, k1, k4);
            Oduzmi(proxy, k1, k5);
            Podeli(proxy, k1, k2);
            Pomnozi(proxy, k1, k2);
            Pomnozi(proxy, k1, k0);

            Console.ReadKey();

        }

        static void Saberi(IKalkulatorKompleksnihBrojeva proxy, KompleksniBroj k1, KompleksniBroj k2)
        {
            KompleksniBroj rezultat = proxy.Saberi(k1, k2);
            Console.WriteLine($"({k1}) + ({k2}) = {rezultat}");            
        }

        static void Oduzmi(IKalkulatorKompleksnihBrojeva proxy, KompleksniBroj k1, KompleksniBroj k2)
        {
            KompleksniBroj rezultat = proxy.Oduzmi(k1, k2);
            Console.WriteLine($"({k1}) - ({k2}) = {rezultat}");

        }

        static void Pomnozi(IKalkulatorKompleksnihBrojeva proxy, KompleksniBroj k1, KompleksniBroj k2)
        {
            KompleksniBroj rezultat = proxy.Pomnozi(k1, k2);
            Console.WriteLine($"({k1}) * ({k2}) = {rezultat}");

        }

        static void Podeli(IKalkulatorKompleksnihBrojeva proxy, KompleksniBroj k1, KompleksniBroj k2)
        {
            try
            {
                KompleksniBroj rezultat = proxy.Podeli(k1, k2);
                Console.WriteLine($"({k1}) / ({k2}) = {rezultat}");
            } catch (FaultException<KalkulatorKompleksnihBrojevaIzuzetak> ex) 
            {
                Console.WriteLine($"ERROR : {ex.Detail.Razlog}");
            }
            

        }
    }
}
