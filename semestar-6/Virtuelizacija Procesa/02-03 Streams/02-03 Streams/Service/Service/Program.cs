using System;
using System.ServiceModel;

namespace Service
{
    class Program
    {
        static void Main()
        {
            ServiceHost host = new ServiceHost(typeof(FileHandlingService));
            host.Open();
            Console.WriteLine("Service is open, press any key to close it.");
            Console.ReadKey();
            host.Close();
            Console.WriteLine("Service is closed");
        }
    }
}
