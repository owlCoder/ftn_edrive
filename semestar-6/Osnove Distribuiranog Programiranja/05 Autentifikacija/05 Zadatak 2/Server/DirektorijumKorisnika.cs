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
    class DirektorijumKorisnika
    {
        private Dictionary<string, Korisnik> korisnici = new Dictionary<string, Korisnik>();
        private Dictionary<string, string> autentifikovani = new Dictionary<string, string>(); 
        private const string _pepper = "P&0myWHq";

        public DirektorijumKorisnika()
        {
            DodajKorisnika("user", "user");
            DodajKorisnika("admin", "admin");
        }

        private string KodiranTekst(string lozinka)
        {
            using (var sha = SHA256.Create())
            {
                var computedHash = sha.ComputeHash(
                Encoding.Unicode.GetBytes(lozinka + _pepper));
                return Convert.ToBase64String(computedHash);
            }
        }

        public void DodajKorisnika(string ime, string lozinka)
        {
            korisnici.Add(ime, new Korisnik(ime, this.KodiranTekst(lozinka)));
        }

        public string AutentifikacijaKorisnika(string ime, string lozinka)
        {
            if (korisnici.ContainsKey(ime)
            && this.KodiranTekst(lozinka) == korisnici[ime].Lozinka)
            {
                korisnici[ime].Autentifikovan = true;
                string token = this.KodiranTekst(ime + _pepper);
                autentifikovani.Add(token, ime);
                return token;
            }
            else
            {
                throw new FaultException<BezbednosniIzuzetak>(new BezbednosniIzuzetak("Neispravno korisnicko ime i/ili lozinka."));
            }
        }

        public bool KorisnikAutentifikovan(string token)
        {
            if (autentifikovani.ContainsKey(token))
                return true;
            else
                throw new FaultException<BezbednosniIzuzetak>(new BezbednosniIzuzetak("Korisnik nije autentifikovan"));
        }
    }
}
