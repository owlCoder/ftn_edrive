using Common.Implementacije;
using Heater;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Runtime.Remoting;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Documents;
using System.Windows.Media;

namespace Korisnicki_interfejs
{
    public partial class MainWindow : Window
    {
        DeviceCollection uredjaji = new DeviceCollection();
        List<Device.Device> prikaz = new List<Device.Device>();
        Regulator regulator = null;
        int []port = new int[100];
        int instance = 0;
        public MainWindow()
        {
            InitializeComponent();

            // povezivanje datagrid i kolekcije uredjaja
            //aktivniUredjaji.ItemsSource = uredjaji.GetDevices();

            // portovi za uredjaj
            for (int i = 0; i < 100; i++) 
                port[i] = 8500 + i; // 8500 -> 8600
        }

        private void dodajNoviUredjajBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                // svaka instanca je novi port
                // kreiranje novog procesa
                string dir = Environment.CurrentDirectory;
                dir = Directory.GetParent(dir).Parent.Parent.FullName;

                Process pro = new Process();

                pro.StartInfo.FileName = dir + "\\bin\\Debug\\Device.exe";
                pro.StartInfo.Arguments = port[instance].ToString();
                pro.StartInfo.WindowStyle = ProcessWindowStyle.Minimized;

                pro.Start();

                string strConn = "tcp://localhost:" + port[instance].ToString() + "/Device";
                Device.Device mr = RemotingServices.Connect(typeof(Device.Device), strConn) as Device.Device;

                if (uredjaji.AddDevice(mr))
                {
                    MessageBox.Show("Uređaj je uspešno dodat!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
                    instance++; // sledeci port

                    // azuriranje prikaza u datagrid
                    var tmp = new Device.Device(mr.DeviceId, mr.Temperatura);
                    prikaz.Add(tmp);
                }
                else
                {
                    MessageBox.Show("Nije moguće dodati novi uređaj!\nPrekoračili ste limit uređaja za dodavanje!", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message, "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);

            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            // zatvaranje programa
            Close();
        }

        private void cuvanjeDnevneTempBtn_Click(object sender, RoutedEventArgs e)
        {
            if (uredjaji.GetDevices().Count < 4)
            {
                MessageBox.Show("Potrebno je dodati minimalno 4 uređaja!", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }
            if (pocetakDnevna.SelectedIndex != -1 && krajDnevna.SelectedIndex != -1 && !tempDnevna.Text.Equals(""))
            {
                try
                {
                    // prikazi uredjaje 
                    aktivniUredjaji.ItemsSource = prikaz;

                    int pd = Int32.Parse(pocetakDnevna.Text);
                    int kd = Int32.Parse(krajDnevna.Text);

                    if (pd > kd)
                    {
                        MessageBox.Show("Nije moguće sačuvati podešavanja!\nUnelite ste nevalidne vrednosti!", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                        return;
                    }

                    CheckFields(pd, kd);
                    SetupUredjaja();
                }
                catch (Exception)
                {
                    MessageBox.Show("Niste uneli broj!", "Greška", MessageBoxButton.OK, MessageBoxImage.Warning);
                }
            }
            else
            {
                MessageBox.Show("Nije moguće sačuvati podešavanja!\nUneli ste nevalidne vrednosti!", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void SetupUredjaja()
        {
            // onemoguci dodavanje uredjaja
            dodajNoviUredjajBtn.IsEnabled = false;

            // kreiranje regulatora
            regulator = new Regulator();

            // uvezivanje uredjaja i regulatora
            regulator.Uredjaji = uredjaji.GetDevices();
            regulator.ZeljenaDnevnaTemperatura = Double.Parse(tempDnevna.Text);
            regulator.PocetakDnevniRezim = Int32.Parse(pocetakDnevna.Text);
            regulator.KrajDnevniRezim = Int32.Parse(krajDnevna.Text);
        }

        private void CheckFields(int pd, int kd)
        {
            // omoguci unos nocne temperature
            // i dugme za start termo regulatora
            tempNocna.IsEnabled = true;

            pocetakNocna.Items.Clear(); // ocisti vrednosti
            krajNocna.Items.Clear(); // ocisti vrednosti

            pocetakNocna.Items.Add(kd);
            krajNocna.Items.Add(pd);
            pocetakNocna.SelectedIndex = 0;
            krajNocna.SelectedIndex = 0;

            // onemoguci prvi unos
            pocetakDnevna.IsEnabled = false;
            krajDnevna.IsEnabled = false;
            cuvanjeDnevneTempBtn.IsEnabled = false;
            tempDnevna.IsEnabled = false;

            startTermoBtn.IsEnabled = true;
        }

        private async void startTermoBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                regulator.ZeljenaNocnaTemperatura = Double.Parse(tempNocna.Text);

                tempNocna.IsEnabled = false;
                startTermoBtn.IsEnabled = false;

                MessageBox.Show("Regulator započinje sa radom!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);

                // broj instanci uredjaja proslediti na regulator
                // niz portova na kojima se uredjaji hostuju
                regulator.InstanceCnt = instance;

                // zapocni regulaciju
                regulator.Regulacija();

                // promena statusa
                statusRegulatora.Content = "Status: Radi";
                statusRegulatora.Foreground = Brushes.DarkBlue;
                ProveraProsecneTemperature();

                await ProveraPreostaleTemperature();
            }
            catch (Exception)
            {
                MessageBox.Show("Niste uneli broj!", "Greška", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void ProveraProsecneTemperature()
        {
            try
            {
                // procena preostalog vremena
                double sum = 0;
                foreach (Device.Device d in uredjaji.GetDevices())
                {
                    sum += d.Temperatura;
                }

                sum /= uredjaji.GetDevices().Count;

                double preostalo = Double.Parse(tempDnevna.Text) - Math.Round(sum, 2);

                if (preostalo > 0)
                {
                    statusRegulatora.Content = "Status: Radi";
                    statusRegulatora.Foreground = Brushes.DarkBlue;
                    tempLeft.Content = "Preostalo: " + preostalo.ToString().Replace(',', '.') + "°C";
                }
                else
                {
                    statusRegulatora.Content = "Status: Idle";
                    statusRegulatora.Foreground = Brushes.DarkCyan;

                    tempLeft.Content = "Preostalo: " + "0.0" + "°C";
                    tempLeft.Foreground = Brushes.DarkCyan;
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Greška u premeru preostale temperature zagrevanja!", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }

        private async Task ProveraPreostaleTemperature()
        {
            CancellationToken ct = new CancellationToken();
            TimeSpan vreme = new TimeSpan(0, 0, 2); // provera na 3 minute

            for (; !ct.IsCancellationRequested;)
            {
                await PeriodicnaProvera(vreme, ct);

                ProveraProsecneTemperature();
            }
        }

        public async Task PeriodicnaProvera(TimeSpan interval, CancellationToken cancellationToken)
        {
            await Task.Delay(interval, cancellationToken);
        }
    }
}
