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
        static readonly DirektorijumKorisnika direktorijum = new DirektorijumKorisnika();
        public string Autentifikacija(string korisnickoIme, string lozinka)
        {
            return direktorijum.AutentifikacijaKorisnika(korisnickoIme, lozinka);
        }

        public void DodajLice(FizickoLice fizickoLice, string token)
        {
            direktorijum.KorisnikAutentifikovan(token);
            direktorijum.KorisnikAutorizovan(token, EPravaPristupa.Azuriranje);
            
                if (!BazaPodataka.fizickaLica.ContainsKey(fizickoLice.Jmbg))
                {
                    BazaPodataka.fizickaLica[fizickoLice.Jmbg] = fizickoLice;
                }
                else
                {
                    ServisFizickihLicaIzuzetak izuzetak =
                        new ServisFizickihLicaIzuzetak("Korisnik sa prosledjenim JMBG-om" +
                        " vec postoji. Nije moguce dodavanje");
                    throw new FaultException<ServisFizickihLicaIzuzetak>(izuzetak);
                }
        }

        public void ObrisiLice(long jmbg, string token)
        {
            direktorijum.KorisnikAutentifikovan(token);
            direktorijum.KorisnikAutorizovan(token, EPravaPristupa.Azuriranje);

            if (!BazaPodataka.fizickaLica.Remove(jmbg))
                {
                    ServisFizickihLicaIzuzetak izuzetak =
                            new ServisFizickihLicaIzuzetak("Korisnik sa prosledjenim JMBG-om" +
                            " ne postoji. Nije moguce brisanje");
                    throw new FaultException<ServisFizickihLicaIzuzetak>(izuzetak);
                }
            
        }

        public List<FizickoLice> OcitavanjeLica()
        {
            return BazaPodataka.fizickaLica.Values.ToList();
        }

        public List<FizickoLice> SpisakLica(string token)
        {
            direktorijum.KorisnikAutentifikovan(token);
            direktorijum.KorisnikAutorizovan(token, EPravaPristupa.Citanje);

            return BazaPodataka.fizickaLica.Values.ToList();
            
        }

        public void UpisLica(List<FizickoLice> lica)
        {
            foreach(var l in lica)
            {
                BazaPodataka.fizickaLica[l.Jmbg] = l;
            }
        }
    }
}
