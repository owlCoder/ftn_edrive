using Common;
using System;
using System.ServiceModel;

namespace Server
{
    public class Program
    {
        static void Main()
        {
            ServiceHost svc = new ServiceHost(typeof(FizickoLiceService));
            svc.Open();
            
            Console.WriteLine("Pritisnite [Enter] za zaustavljanje servisa.");
            Console.ReadLine();
        }
    }
}
