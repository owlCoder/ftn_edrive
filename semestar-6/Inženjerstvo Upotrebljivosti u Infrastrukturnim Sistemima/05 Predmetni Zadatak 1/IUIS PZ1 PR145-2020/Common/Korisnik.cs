namespace Common
{
    public class Korisnik
    {
        public string KorisnickoIme { get; set; }
        public string Lozinka { get; set; }
        public bool Admin { get; set; }

        public Korisnik(string korisnickoIme, string lozinka, bool urednik)
        {
            KorisnickoIme = korisnickoIme;
            Lozinka = lozinka;
            Admin = urednik;
        }
    }
}
