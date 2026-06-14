using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Threading.Tasks;

namespace Httpd
{
    class Program
    {
        public static List<Porudzbina> porudzbine = new List<Porudzbina>();

        public static void StartListening()
        {

            IPAddress ipAddress = IPAddress.Loopback;
            IPEndPoint localEndPoint = new IPEndPoint(ipAddress, 8080);

            Socket serverSocket = new Socket(AddressFamily.InterNetwork,
                SocketType.Stream, ProtocolType.Tcp);

            try
            {
                serverSocket.Bind(localEndPoint);
                serverSocket.Listen(10);

                while (true)
                {
                    Console.WriteLine("Waiting for a connection...");
                    Socket socket = serverSocket.Accept();

                    Task t = Task.Factory.StartNew(() => Run(socket));
                }

            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }

            Console.WriteLine("\nPress ENTER to continue...");
            Console.Read();
        }

        private static void Run(Socket socket)
        {

            NetworkStream stream = new NetworkStream(socket);
            StreamReader sr = new StreamReader(stream);
            StreamWriter sw = new StreamWriter(stream) { NewLine = "\r\n", AutoFlush = true };

            string resource = GetResource(sr);

            if (resource != null)
            {
                if (resource.Equals(""))
                    resource = "index.html";

                Console.WriteLine("Request from " + socket.RemoteEndPoint + ": " + resource + "\n");

                if (resource.StartsWith("dodaj?"))
                {
                    string[] porudzbina = resource.Split(new string[] { "kod=", "adresa=", "telefon=", "proizvod=", "placanje=" }, StringSplitOptions.None);
                    sw.Write("HTTP/1.0 200 OK\r\n\r\n");

                    string kod_string = GetPropertyValue(porudzbina[1]);
                    string adresa = GetPropertyValue(porudzbina[2]);
                    string telefon = GetPropertyValue(porudzbina[3]);
                    string proizvod = GetPropertyValue(porudzbina[4]);
                    string placanje = GetPropertyValue(porudzbina[5]);

                    if (!int.TryParse(kod_string, out int kod))
                    {
                        sw.Write("<html><body><h2 style='color: crimson;'>Niste uneli broj za kod porudzbine!</h2>" +
                            "<br/><a href='/'>Povratak na pocetnu stranicu</a></body></html>");
                    }
                    else
                    {
                        // ako postoji porudzbina ispisati gresku
                        foreach (Porudzbina p in porudzbine)
                        {
                            if (p.Kod == kod)
                            {
                                sw.Write("<html><body><h2>Porudzbina sa kodom " + kod_string + " vec postoji!</h2>" +
                            "<a href='/'>Povratak na pocetnu stranicu</a></body></html>");
                                return;
                            }
                        }

                        Porudzbina nova = new Porudzbina(kod, adresa, telefon, proizvod, placanje);
                        porudzbine.Add(nova);

                        // ispis tabele sa svim porudzbinama nakon uspesnog dodavanja
                        sw.Write("<html><head><style>th { padding: 0px 30px; }  td { padding: 0px 50px 0px 0px; }</style></head><body>");
                        sw.Write(IspisTabelePorudzbina());
                        sw.Write("</body></html>");
                    }
                }
                else if (resource.StartsWith("pretraga?"))
                {
                    string[] porudzbina = resource.Split(new string[] { "kod=" }, StringSplitOptions.None);
                    string kod_string = GetPropertyValue(porudzbina[1]);
                    sw.Write("HTTP/1.0 200 OK\r\n\r\n");

                    if (!int.TryParse(kod_string, out int kod))
                    {
                        sw.Write("<html><body><h2 style='color: crimson;'>Niste uneli broj za kod porudzbine!</h2>" +
                            "<br/><a href='/'>Povratak na pocetnu stranicu</a></body></html>");
                    }
                    else
                    {
                        foreach (Porudzbina p in porudzbine)
                        {
                            if (p.Kod == kod)
                            {
                                sw.Write("<html><head><style>th { padding: 0px 30px; }  td { padding: 0px 50px 0px 0px; }</style></head><body>");
                                sw.Write(IspisPorudzbine(p));
                                sw.Write("</body></html>");

                                return;
                            }
                        }

                        // porudzbina ne postoji, ispisati gresku
                        sw.Write("<html><body><h2>Ne postoji porudzbina sa kodom " + kod_string + "!</h2>" +
                            "<a href='/'>Povratak na pocetnu stranicu</a></body></html>");
                    }
                }
                else if (resource.StartsWith("pregled"))
                {
                    sw.Write("HTTP/1.0 200 OK\r\n\r\n");
                    sw.Write("<html><head><style>th { padding: 0px 30px; }  td { padding: 0px 50px 0px 0px; }</style></head><body>");
                    sw.Write(IspisTabelePorudzbina());
                    sw.Write("</body></html>");
                }
                else
                {
                    SendResponse(resource, socket, sw);
                }
            }

            sr.Close();
            sw.Close();
            stream.Close();

            socket.Shutdown(SocketShutdown.Both);
            socket.Close();
        }

        private static string GetPropertyValue(string field)
        {
            string new_field = field.Split('&')[0];
            new_field = Uri.UnescapeDataString(new_field);
            new_field = new_field.Replace("+", " ");

            return new_field;
        }

        private static string IspisTabelePorudzbina()
        {
            string ispis = "";

            ispis += "<table border='1'>" +
                "<tr>" +
                "<th colspan='5' style='text-align: center;'>Porudzbine</th>" +
                "</tr>" +
                "<tr>" +
                "<th>KOD</th>" +
                "<th>Adresa</th>" +
                "<th>Telefon</th>" +
                "<th>Proizvod</th>" +
                "<th>Tip placanja</th>" +
                "</tr>";

            if (porudzbine.Count == 0)
            {
                ispis += "<tr><td colspan='5'>Nema porudzbina</td></tr>";
            }
            else
            {
                foreach (Porudzbina p in porudzbine)
                {
                    ispis += "<tr>" +
                        "<td>" + p.Kod + "</td>" +
                        "<td>" + p.Adresa + "</td>" +
                        "<td>" + p.Telefon + "</td>" +
                        "<td>" + p.Proizvod.ToUpper() + "</td>" +
                        "<td>" + p.NacinPlacanja.ToUpper() + "</td>" +
                        "</tr>";
                }
            }

            ispis += "</table>\r\n";
            ispis += "<br/><a href='/'>Povratak na pocetnu stranicu</a>";

            return ispis;
        }

        public static string IspisPorudzbine(Porudzbina p)
        {
            string ispis = "";

            ispis += "<table border='1'>" +
                "<tr>" +
                "<th colspan='5' style='text-align: center;'>Porudzbina sa kodom: " + p.Kod + "</th>" +
                "</tr>" +
                "<tr>" +
                "<th>Adresa</th>" +
                "<th>Telefon</th>" +
                "<th>Proizvod</th>" +
                "<th>Tip placanja</th>" +
                "</tr>";

            ispis += "<tr>" +
                "<td>" + p.Adresa + "</td>" +
                "<td>" + p.Telefon + "</td>" +
                "<td>" + p.Proizvod.ToUpper() + "</td>" +
                "<td>" + p.NacinPlacanja.ToUpper() + "</td>" +
                "</tr>";

            ispis += "</table>\r\n";
            ispis += "<br/><a href='/'>Povratak na pocetnu stranicu</a>";

            return ispis;
        }

        private static string GetResource(StreamReader sr)
        {
            string line = sr.ReadLine();
            if (line == null)
                return null;
            String[] tokens = line.Split(' ');

            string method = tokens[0];
            if (!method.Equals("GET"))
            {
                return null;
            }

            string rsrc = tokens[1];

            rsrc = rsrc.Substring(1);

            string s1;
            while (!(s1 = sr.ReadLine()).Equals(""))
                Console.WriteLine(s1);
            Console.WriteLine("Request: " + line);
            return rsrc;
        }

        private static void SendResponse(string resource, Socket socket, StreamWriter sw)
        {
            resource = "../../../" + resource;
            FileInfo fi = new FileInfo(resource);

            string responseText;
            if (!fi.Exists)
            {
                responseText = "HTTP/1.0 404 File not found\r\n"
                        + "Content-type: text/html; charset=UTF-8\r\n\r\n<b>404 Stranica nije pronadjena!:"
                        + fi.Name + "</b>";
                sw.Write(responseText);
                Console.WriteLine("Could not find resource: " + fi.Name);
                return;
            }

            responseText = "HTTP/1.0 200 OK\r\n\r\n";
            sw.Write(responseText);
            socket.SendFile(resource);
        }

        public static int Main(String[] args)
        {
            StartListening();
            return 0;
        }
    }
}