namespace Httpd
{
    public class Porudzbina
    {
        public int Kod { get; set; }
        public string Adresa { get; set; }
        public string Telefon { get; set; }
        public string Proizvod { get; set; }
        public string NacinPlacanja { get; set; }

        public Porudzbina(int kod, string adresa, string telefon, string proizvod, string nacinPlacanja)
        {
            Kod = kod;
            Adresa = adresa;
            Telefon = telefon;
            Proizvod = proizvod;
            NacinPlacanja = nacinPlacanja;
        }
    }
}
