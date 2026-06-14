using System;
using System.ServiceModel;

namespace Server
{
    class Program
    {
        static void Main(string[] args)
        {
            ServiceHost host, hostReplikator;

            // server
            try
            {
                host = new ServiceHost(typeof(StudentskaSluzbaServis));
                host.Open();
            }
            catch(Exception e)
            {
                Console.WriteLine(e.Message);
            }

            // replikator
            try
            {
                hostReplikator = new ServiceHost(typeof(Replikator));
                hostReplikator.Open();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }

            Console.WriteLine("Servis je uspesno pokrenut!");
            Console.ReadLine();
        }
    }
}
