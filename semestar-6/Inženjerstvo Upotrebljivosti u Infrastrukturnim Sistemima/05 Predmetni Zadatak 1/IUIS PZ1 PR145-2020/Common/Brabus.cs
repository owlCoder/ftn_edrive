using System;

namespace Common
{
    public class Brabus
    {
        public string Hiperlink { get; set; }
        public bool ZaBrisanje { get; set; }
        public string Slika { get; set; }
        public DateTime Datum { get; set; }
        public string ModelAuta { get; set; }
        public string Pogon { get; set; }
        public int GodinaProizvodnje { get; set; }

        public string RtfFajl { get; set; }

        public Brabus(string hiperlink, string slika, string modelAuta, string pogon, int godinaProizvodnje)
        {
            Hiperlink = hiperlink;
            ZaBrisanje = false;
            Slika = slika;
            Datum = DateTime.Now;
            ModelAuta = modelAuta;
            Pogon = pogon;
            GodinaProizvodnje = godinaProizvodnje;
            RtfFajl = Guid.NewGuid().ToString() + ".rtf";
        }
    }
}
