namespace Httpd
{
    public class Klub
    {
        public string Naziv { get; set; }
        public string Grad { get; set; }
        public bool Aktivan { get; set; }
        public int Bodovi { get; set; }

        public Klub(string naziv, string grad, bool aktivan)
        {
            Naziv = naziv;
            Grad = grad;
            Aktivan = aktivan;
            Bodovi = 0;
        }

        public override bool Equals(object obj)
        {
            return obj is Klub klub &&
                   Naziv == klub.Naziv &&
                   Grad == klub.Grad &&
                   Aktivan == klub.Aktivan &&
                   Bodovi == klub.Bodovi;
        }
    }
}
