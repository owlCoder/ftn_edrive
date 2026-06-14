using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Runtime.Remoting.Channels.Tcp;

namespace Device
{
    public class Program
    {
        static void Main(string[] args)
        {
            // .Net Remoting
            Device server = new Device();
            TcpChannel channel = new TcpChannel(int.Parse(args[0]));
            ChannelServices.RegisterChannel(channel, false);
            string uri = "Device";
            RemotingServices.Marshal(server, uri, server.GetType());

            Console.WriteLine("DEVICE ZAPOCINJE SA RADOM");

            Console.WriteLine("PORT: " + args[0]);
            while (true)
            {
                Console.WriteLine("\nINFORMACIJA\n\tID: {0}\n\tTemperatura: {1}°C", server.DeviceId, server.Temperatura);
                Thread.Sleep(2000); // svake druge sekunde ide provera

                Thread.Sleep(new Random().Next(1500, 8000)); // random menja temp
                server.Temperatura = Math.Round((new Random().Next((int)(server.Temperatura - 10), (int)(server.Temperatura + 2)) + (new Random().NextDouble())), 2);
            }
        }
    }
}
