using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using System.IO;

namespace RegistationClient
{
    class RegistrationClient
    {
        class NetworkFolderListClient
        {
            public static void StartClient()
            {

                // Connect to a remote device.
                try
                {
                    // Establish the remote endpoint for the socket.
                    // This example uses port 11000 on the local computer.
                    //IPHostEntry ipHostInfo = Dns.GetHostEntry("localhost");//Dns.Resolve(Dns.GetHostName())
                    //IPAddress ipAddress = ipHostInfo.AddressList[0];
                    IPAddress ipAddress = IPAddress.Loopback;
                    IPEndPoint remoteEP = new IPEndPoint(ipAddress, 11000);

                    // Create a TCP/IP  socket.
                    Socket socket = new Socket(AddressFamily.InterNetwork,
                        SocketType.Stream, ProtocolType.Tcp);

                    // Connect the socket to the remote endpoint. Catch any errors.
                    try
                    {
                        socket.Connect(remoteEP);

                        Console.WriteLine("Socket connected to {0}",
                            socket.RemoteEndPoint.ToString());

                        NetworkStream stream = new NetworkStream(socket);
                        StreamReader sr = new StreamReader(stream);
                        StreamWriter sw = new StreamWriter(stream) { NewLine = "\r\n", AutoFlush = true };

                        // pošaljemo korisničko ime serveru za registratije
                        Console.WriteLine("Unesite korisnicko ime:");

                        // od servera ćemo dobiti nazad listu
                        string line = "";
                        while(!line.Contains("ShutDown"))
                        {
                            line = Console.ReadLine();
                            sw.WriteLine(line);

                            try
                            {
                                while (!(line = sr.ReadLine()).Equals("END"))
                                {
                                    //received += line + "\n";
                                    Console.WriteLine(line);
                                }

                                if (line.Contains("ShutDown"))
                                {
                                    break;
                                }
                            }
                            catch { }
                        }
                        Console.WriteLine("ShutDown");

                        //Console.WriteLine("Stiglo od servera:\n{0}", received);

                        // Release the socket.
                        sr.Close();
                        sw.Close();
                        stream.Close();
                        socket.Shutdown(SocketShutdown.Both);
                        socket.Close();

                    }
                    catch (ArgumentNullException ane)
                    {
                        Console.WriteLine("ArgumentNullException : {0}", ane.ToString());
                    }
                    catch (SocketException se)
                    {
                        Console.WriteLine("SocketException : {0}", se.ToString());
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine("Unexpected exception : {0}", e.ToString());
                    }

                }
                catch (Exception e)
                {
                    Console.WriteLine(e.ToString());
                }
            }

            public static int Main(String[] args)
            {
                StartClient();
                Console.Write("Press any key...");
                Console.ReadKey();
                return 0;
            }
        }
    }
}
