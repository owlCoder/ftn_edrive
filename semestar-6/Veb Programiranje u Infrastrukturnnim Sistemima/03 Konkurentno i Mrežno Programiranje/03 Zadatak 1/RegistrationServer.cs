using System;
using System.Collections;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Net;
using System.Net.Sockets;
using System.IO;

namespace RegistrationServer
{
    class RegistrationServer
    {
        public static ArrayList users = new ArrayList();

        private static readonly string Uspesno = "Uspesno ste dodali korisnika!\n";
        private static readonly string Neuspesno = "Korisnik koga zelite da dodate vec postoji!\n";
        private static readonly string BrisanjeOk = "Uspesno ste obrisali korisnika!\n";
        private static readonly string BrisanjeFail = "Nije moguce obrisati korisnika!\n";
        private static readonly string FindOk = "Trazeni korisnik: ";
        private static readonly string FindFail = "Trazeni korisnik ne postoji!\n";

        public static void StartListening()
        {


            // Establish the local endpoint for the socket.
            // Dns.GetHostName returns the name of the 
            // host running the application.
            //IPHostEntry ipHostInfo = Dns.GetHostEntry("192.168.1.208");//  Dns.Resolve(Dns.GetHostName());
            //IPHostEntry ipHostInfo =  Dns.Resolve(Dns.GetHostName());

            //IPAddress ipAddress = ipHostInfo.AddressList[8];
            IPAddress ipAddress = IPAddress.Loopback; //ipHostInfo.AddressList[0];
            IPEndPoint localEndPoint = new IPEndPoint(ipAddress, 11000);

            // Create a TCP/IP socket.
            Socket serverSocket = new Socket(ipAddress.AddressFamily, //AddressFamily.InterNetwork,
                SocketType.Stream, ProtocolType.Tcp);

            // Bind the socket to the local endpoint and 
            // listen for incoming connections.
            try
            {
                serverSocket.Bind(localEndPoint);
                serverSocket.Listen(10);

                // Start listening for connections.
                while (true)
                {
                    Console.WriteLine("Waiting for a connection...");
                    // Program is suspended while waiting for an incoming connection.
                    Socket socket = serverSocket.Accept();

                    Task<int> t = Task.Factory.StartNew(() => Run(socket));

                }

            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }

            Console.WriteLine("\nPress ENTER to continue...");
            Console.Read();

        }

        private static int Run(Socket socket)
        {

            NetworkStream stream = new NetworkStream(socket);
            StreamReader sr = new StreamReader(stream);
            StreamWriter sw = new StreamWriter(stream) { NewLine = "\r\n", AutoFlush = true };

            Console.WriteLine("Receiving data...");
            string request;
            string result = "";

            while(!(request = sr.ReadLine()).Equals("ShutDown"))
            {
                // ispišemo šta smo primili od klijenta
                Console.WriteLine("Stiglo od klijenta: {0}", request);

                result = ParseMessage(request);

                result += "END";
                Console.WriteLine("Slanje ka klijentu: {0}", result);
                sw.WriteLine(result);
            }

            result = request + "END";
            sw.WriteLine(result);

            sr.Close();
            sw.Close();
            stream.Close();

            socket.Shutdown(SocketShutdown.Both);
            socket.Close();
            return 0;
        }

        private static string ParseMessage(string request)
        {
            string[] splited = request.Split(' ');

            if (splited[0].ToLower().Equals("add"))
            {
                if (splited.Length <= 1)
                    return Neuspesno;

                string[] splitedZarez = splited[1].Split(',');

                // jedan korisnik
                if (splitedZarez.Length == 1)
                {
                    foreach (var l in users)
                    {
                        if (splited[1].Equals(l.ToString()))
                        {
                            return Neuspesno;
                        }
                    }

                    users.Add(splited[1]);

                    return Uspesno;
                }

                // ili se dodaje vise njih
                if(splitedZarez.Length >= 2)
                {
                    string msg = "";
                    for (int i = 0; i < splitedZarez.Length; i++)
                    {
                        foreach (var l in users)
                        {
                            if (splitedZarez[i].Trim().Equals(l))
                            {
                                msg += "Korisnik " + splitedZarez[i] + " vec postoji!";
                                break;
                            }
                        }

                        // dodavanje u listu ako nije nasao
                        users.Add(splitedZarez[i]);
                    }

                    if (msg.Equals(""))
                        return Uspesno;
                    else 
                        return msg;
                }

                return "Bad request!";
            }
            else if (splited[0].ToLower().Equals("remove"))
            {
                for (int i = 1; i < splited.Length; i++)
                {
                    foreach (var l in users)
                    {
                        if (splited[i].Equals(l.ToString()))
                        {
                            users.Remove(splited[i]);
                            return BrisanjeOk;
                        }
                    }
                }

                return BrisanjeFail;
            }
            else if (splited[0].ToLower().Equals("find"))
            {
                for (int i = 1; i < splited.Length; i++)
                {
                    foreach (var l in users)
                    {
                        if (splited[i].Equals(l.ToString()))
                        {
                            return FindOk + " " + l.ToString() + "\n";
                        }
                    }
                }

                return FindFail;
            }
            else if (splited[0].ToLower().Equals("list"))
            {
                string ret = "";
                foreach(var u in users)
                {
                    ret += u.ToString() + "\n";
                }

                return ret;
            }
            else
            {
                return "Bad request!\n";
            }
        }

        public static int Main(String[] args)
        {
            StartListening();
            return 0;
        }
    }
}
