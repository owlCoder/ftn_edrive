using Common;
using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.ServiceModel;
using System.Text;

namespace Server
{
    public enum EPravaPristupa { Modifikacija, Citanje, Brisanje }
    class DirektorijumKorisnika
    {
        private const string _pepper = "P&0myWHq";
        private Dictionary<string, Korisnik> korisnici
            = new Dictionary<string, Korisnik>();

        public DirektorijumKorisnika()
        {
            DodajKorisnika("admin", "admin");
            DodajKorisnika("user", "user");

            korisnici["admin"].DodajPravoPristupa(EPravaPristupa.Modifikacija);
            korisnici["admin"].DodajPravoPristupa(EPravaPristupa.Brisanje);
            korisnici["admin"].DodajPravoPristupa(EPravaPristupa.Citanje);
            korisnici["user"].DodajPravoPristupa(EPravaPristupa.Citanje);
        }

        public void DodajKorisnika(string korisnickoIme, string lozinka)
        {
            korisnici.Add(korisnickoIme, new Korisnik(korisnickoIme, KodiraTekst(lozinka)));
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
            if (korisnici.TryGetValue(korisnickoIme, out Korisnik pronadjen))
            {
                if (pronadjen.Lozinka.Equals(KodiraTekst(lozinka)))
                {
                    string token = KodiraTekst(lozinka + _pepper);
                    pronadjen.Token = token;
                    pronadjen.Autentifikovan = true;

                    return token;
                }
            }

            throw new FaultException<BezbedonosniMehanizmiIzuzetak>(
                  new BezbedonosniMehanizmiIzuzetak("Korisnik nije registrovan na sistem!"));
        }

        public void KorisnikAutentifikovan(string token)
        {
            foreach (Korisnik k in korisnici.Values)
            {
                if (k.Token.Equals(token) && k.Autentifikovan)
                {
                    return;
                }
            }

            throw new FaultException<BezbedonosniMehanizmiIzuzetak>(
                  new BezbedonosniMehanizmiIzuzetak("Korisnik nije autentifikovan!"));
        }

        public bool KorisnikAutentifikovanIAutorizovan(string token, EPravaPristupa pravo)
        {
            foreach (Korisnik k in korisnici.Values)
            {
                if (k.Token != null && k.Token.Equals(token))
                {
                    if (k.ProveriPravoPristupa(pravo) == false)
                    {
                        throw new FaultException<BezbedonosniMehanizmiIzuzetak>(
                              new BezbedonosniMehanizmiIzuzetak("Korisnik nema potrebno pravo pristupa!"));
                    }
                }
            }

            return true;
        }

        public bool DodajPravaKorisniku(string korisnickoIme, EPravaPristupa pravoPristupa)
        {
            if (korisnici.TryGetValue(korisnickoIme, out Korisnik korisnik))
            {
                return korisnik.DodajPravoPristupa(pravoPristupa);
            }

            return false;
        }

        public bool ProveroPravoKorisnika(string korisnickoIme, EPravaPristupa pravoPristupa)
        {
            if (korisnici.TryGetValue(korisnickoIme, out Korisnik korisnik))
            {
                return korisnik.ProveriPravoPristupa(pravoPristupa);
            }

            return false;
        }
    }
}
