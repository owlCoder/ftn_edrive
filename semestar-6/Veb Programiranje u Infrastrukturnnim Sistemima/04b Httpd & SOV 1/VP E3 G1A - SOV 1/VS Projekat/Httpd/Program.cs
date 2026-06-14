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
        public static List<Klub> klubovi = new List<Klub>()
        {
            new Klub("FK Vojvodina", "Novi Sad", true),
            new Klub("FK Hajduk", "Beograd", false),
            new Klub("FK Partizan", "Subotica", true),
        };

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

                string http_header = "HTTP/1.0 200 OK\r\n\r\n";

                if (resource.StartsWith("dodaj?"))
                {
                    string[] klub = resource.Split(new string[] { "naziv=", "grad=", "aktivan=" }, StringSplitOptions.None);
                    sw.Write(http_header);

                    string naziv = GetPropertyValue(klub[1]);
                    string grad = GetPropertyValue(klub[2]);
                    string aktivan = GetPropertyValue(klub[3]);

                    Klub novi = new Klub(naziv, grad, Convert.ToBoolean(aktivan));

                    foreach (Klub k in klubovi)
                    {
                        if (k.Equals(novi))
                        {
                            sw.Write("<html><body><h1 style='color: red'>Klub vec postoji!</h1>" +
                                "<a href='/'>Povratak na pocetnu stranicu</a></body></html>");
                            return;
                        }
                    }

                    klubovi.Add(novi);

                    sw.Write("<html><body>");
                    sw.Write(IspisSvihKlubova());
                    sw.Write("</html></body>");
                }
                else if (resource.StartsWith("upisBodova?"))
                {
                    sw.Write(http_header);
                    string[] klub = resource.Split(new string[] { "idk=", "bodovi=" }, StringSplitOptions.None);

                    int.TryParse(GetPropertyValue(klub[1]), out int idk);
                    int.TryParse(GetPropertyValue(klub[2]), out int bodovi);

                    klubovi[idk - 1].Bodovi = bodovi;

                    sw.Write("<html><body>");
                    sw.Write(IspisSvihKlubova());
                    sw.Write("</html></body>");
                }
                else if (resource.StartsWith("izmena?"))
                {
                    sw.Write(http_header);
                    string[] klub = resource.Split(new string[] { "idk=" }, StringSplitOptions.None);

                    int.TryParse(GetPropertyValue(klub[1]), out int idk);

                    sw.Write("<html><body>");
                    sw.Write(IzmenaKluba(klubovi[idk - 1], idk - 1));
                    sw.Write("</html></body>");
                }
                else if (resource.StartsWith("izmenaPodataka?"))
                {
                    string[] klub = resource.Split(new string[] { "idk=", "naziv=", "grad=", "aktivan=" }, StringSplitOptions.None);
                    sw.Write(http_header);

                    int.TryParse(GetPropertyValue(klub[1]), out int idk);
                    string naziv = GetPropertyValue(klub[2]);
                    string grad = GetPropertyValue(klub[3]);
                    string aktivan = GetPropertyValue(klub[4]);

                    klubovi[idk].Naziv = naziv;
                    klubovi[idk].Grad = grad;
                    klubovi[idk].Aktivan = Convert.ToBoolean(aktivan);

                    sw.Write("<html><body>");
                    sw.Write(IspisSvihKlubova());
                    sw.Write("</html></body>");
                }
                else if (resource.StartsWith("prikazVodeceg"))
                {
                    sw.Write(http_header);

                    if (klubovi.Count == 0)
                    {
                        sw.Write("<html><body><h1 style='color: red'>Nema vodeceg kluba!</h1>" +
                                "<a href='/'>Povratak na pocetnu stranicu</a></body></html>");
                    }
                    else
                    {
                        Klub vodeci = klubovi[0];

                        for (int i = 1; i < klubovi.Count; i++)
                        {
                            if (klubovi[i].Bodovi > vodeci.Bodovi)
                            {
                                vodeci = klubovi[i];
                            }
                        }

                        sw.Write("<html><body>");
                        sw.Write("<p>Trenutno vodeci klub: <b>" + vodeci.Naziv + " " + vodeci.Grad + "</b></p>" +
                            "<a href='/'>Povratak na pocetnu stranicu</a>");
                        sw.Write("</html></body>");
                    }
                }
                else if (resource.StartsWith("pregled"))
                {
                    sw.Write(http_header);
                    sw.Write("<html><body>");
                    sw.Write(IspisSvihKlubova());
                    sw.Write("</html></body>");
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

        private static string IspisSvihKlubova()
        {
            int count = 1;
            string ispis = "";

            ispis += "<h1 style='color: blue;'>Tabela</h1>";
            ispis +=
                "<table border='1' style='text-align: center;'>" +
                "<tr>" +
                "<th>#</th>" +
                "<th>Klub</th>" +
                "<th>Bodovi</th>" +
                "<th>Akcija</th>" +
                "</tr>";

            foreach (Klub k in klubovi)
            {
                ispis += "<tr>" +
                    "<td>" + count + "</td>" +
                    "<td>" + k.Naziv + " " + k.Grad + "</td>" +
                    "<td>" + k.Bodovi + "</td>" +
                    "<td>" + "<a href='izmena?idk=" + count + "'>Izmena podataka</a></td>" +
                    "</tr>";

                count++;
            }

            ispis += "</table>";
            ispis += "<br/><a href='/'>Dodaj novi klub</a>";
            ispis += "<br/><br/><a href='prikazVodeceg'>Prikazi vodeci klub</a>";

            ispis += "<h1 style='color: blue;'>Upis bodova</h1>";

            ispis += "<form action='upisBodova'>" +
                "<table>" +
                "<tr>" +
                "<td>Klub</td>" +
                "<td>" +
                "<select name='idk' style='width: 180px;'>";

            count = 1;

            foreach (Klub k in klubovi)
            {
                ispis += "<option value='" + count + "'>" + k.Naziv + " " + k.Grad + "</option>";
                count++;
            }

            ispis += "</select></td>" +
            "</tr>" +
            "<tr>" +
            "<td>Bodovi</td>" +
            "<td><input type='number' name='bodovi' style='width: 180px;' required /></td>" +
            "</tr>" +
            "<tr style='text-align: center;'><td></td><td><input type='submit' value='unesi' /></td></tr>" +
            "</table>" +
            "</form>";

            return ispis;
        }


        private static string IzmenaKluba(Klub k, int count)
        {
            string ispis = "";
            string[] odabran = { "", "", "", "" };

            if (k.Grad.Equals("Novi Sad"))
                odabran[0] = " selected='selected'";
            else if (k.Grad.Equals("Beograd"))
                odabran[1] = " selected='selected'";
            else if (k.Grad.Equals("Subotica"))
                odabran[2] = " selected='selected'";
            else
                odabran[3] = " selected='selected'";

            ispis += "<h1 style='color: green;'>Izmena podataka</h1>" +
                "<form action='izmenaPodataka'>" +
                "<table>" +
                "<tr><td><input type='hidden' name='idk' value='" + count + "'/></td></tr>" +
                "<tr><td>Naziv</td>" +
                "<td><input type='text' name='naziv' required value='" + k.Naziv + "'/></td></tr>" +
                "<tr><td>Grad</td><td>" +
                "<select name='grad' required>" +
                "<option value='Novi Sad'" + odabran[0] + ">Novi Sad</option>" +
                "<option value='Beograd'" + odabran[1] + ">Beograd</option>" +
                "<option value='Subotica'" + odabran[2] + ">Subotica</option>" +
                "<option value='Kraljevo'" + odabran[3] + ">Kraljevo</option>" +
                "</select></td></tr><tr><td>Aktivan</td><td>" +
                "<input type='checkbox' name='aktivan' value='true'" + (k.Aktivan ? " checked " : "") + " />" +
                "<input type='hidden' id='aktivan' value='false' name='aktivan' /></td></tr>" +
                "<tr><td></td>" +
                "<td><input type='submit' value='Izmeni' /></td></tr>" +
                "</table>" +
                "</form>";

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