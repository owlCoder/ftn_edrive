using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;
using Common;

namespace Server
{
    class FizickaLicaServer : IFizickaLica, IBezbednosniMehanizmi
    {
        private static DirektorijumKorisnika direktorijumKorisnika = new DirektorijumKorisnika();
        public string Autentifikacija(string korisnik, string lozinka)
        {
            return direktorijumKorisnika.AutentifikacijaKorisnika(korisnik, lozinka);
        }

        public void DodajLice(FizickoLice fizickoLice, string token)
        {
            direktorijumKorisnika.KorisnikAutentifikovan(token);

            if (!BazaPodataka.fizickaLica.ContainsKey(fizickoLice.Jmbg))
            {
                BazaPodataka.fizickaLica[fizickoLice.Jmbg] = fizickoLice;
            }
            else 
            {
                ServisFizickihLicaIzuzetak izuzetak = 
                    new ServisFizickihLicaIzuzetak("Korisnik sa prosledjenim JMBG-om" + " vec postoji. Nije moguce dodavanje");
                throw new FaultException<ServisFizickihLicaIzuzetak>(izuzetak);
            }
        }

        public void ObrisiLice(long jmbg, string token)
        {
            direktorijumKorisnika.KorisnikAutentifikovan(token);

            if (!BazaPodataka.fizickaLica.Remove(jmbg))
            {
                ServisFizickihLicaIzuzetak izuzetak =
                        new ServisFizickihLicaIzuzetak("Korisnik sa prosledjenim JMBG-om" +
                        " ne postoji. Nije moguce brisanje");
                throw new FaultException<ServisFizickihLicaIzuzetak>(izuzetak);
            }
        }

        public List<FizickoLice> SpisakLica(string token)
        {
            return BazaPodataka.fizickaLica.Values.ToList();
        }
    }
}
