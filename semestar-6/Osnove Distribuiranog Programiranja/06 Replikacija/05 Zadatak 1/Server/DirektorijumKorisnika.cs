using Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;

namespace Server
{
    public enum EPravaPristupa { Citanje, Azuriranje};

    class DirektorijumKorisnika
    {
        private const string _pepper = "P&0myWHq";
        private Dictionary<string, Korisnik> korisnici
            = new Dictionary<string, Korisnik>();
        private Dictionary<string, string> autentifikovani
            = new Dictionary<string, string>();
        private Dictionary<string, SortedSet<EPravaPristupa>> pravaKorisnika
            = new Dictionary<string, SortedSet<EPravaPristupa>>();

        public DirektorijumKorisnika()
        {
            DodajKorisnka("pera", "p3ra");
            DodajKorisnka("admin", "Adm1n");

            SortedSet<EPravaPristupa> pravaAdmin = new SortedSet<EPravaPristupa>();
            pravaAdmin.Add(EPravaPristupa.Citanje);
            pravaAdmin.Add(EPravaPristupa.Azuriranje);
            pravaKorisnika.Add("admin", pravaAdmin);

            SortedSet<EPravaPristupa> pravaPera = new SortedSet<EPravaPristupa>();
            pravaPera.Add(EPravaPristupa.Citanje);
            pravaKorisnika.Add("pera", pravaPera);
        }

        public void DodajKorisnka(string korisnickoIme, string lozinka)
        {
            korisnici.Add(korisnickoIme, 
                new Korisnik()
                {
                    KorisnickoIme = korisnickoIme,
                    Lozinka = KodiraTekst(lozinka)}
                );
        }

        private string KodiraTekst(string lozinka)
        {
            using (var sha = SHA256.Create())
            {
                var computedHash = sha.ComputeHash(
                Encoding.Unicode.GetBytes(lozinka + _pepper));
                return Convert.ToBase64String(computedHash);
            }
        }

        public string AutentifikacijaKorisnika(string korisnickoIme, string lozinka)
        {
            if (korisnici.TryGetValue(korisnickoIme, out Korisnik korisnik))
            {
                if (KodiraTekst(lozinka).Equals(korisnik.Lozinka))
                {
                    korisnik.Autentifikovan = true;
                    string token = KodiraTekst(korisnickoIme + _pepper);
                    autentifikovani[token] = korisnickoIme;
                    return token;
                }
            }
           
                BezbednosniIzuzetak izuzetak = new BezbednosniIzuzetak()
                {
                    Poruka = "Korisnicko ime ili sifra nisu dobri."
                };
                throw new FaultException<BezbednosniIzuzetak>(izuzetak);
        }        
        public void KorisnikAutentifikovan(string token)
        {
            if (!autentifikovani.ContainsKey(token))
            {
                BezbednosniIzuzetak izuzetak = new BezbednosniIzuzetak()
                {
                    Poruka = "Korisnik nije autentifikovan."
                };
                throw new FaultException<BezbednosniIzuzetak>(izuzetak);
            }
        }

        public bool KorisnikAutorizovan(string token, EPravaPristupa pravo)
        {
            if (autentifikovani.ContainsKey(token) &&
               pravaKorisnika.ContainsKey(autentifikovani[token]) &&
               pravaKorisnika[autentifikovani[token]].Contains(pravo))
                return true;
            else
            {
                BezbednosniIzuzetak izuzetak = new BezbednosniIzuzetak()
                {
                    Poruka = "Korisnik nema pravo " + pravo.ToString()
                };
                throw new FaultException<BezbednosniIzuzetak>(izuzetak);
            }
        }

    }
}
