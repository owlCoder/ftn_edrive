using Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;

namespace Server
{
    class FizickaLicaServer : IFizickaLica
    {

        public void DodajLice(FizickoLice fizickoLice)
        {

            if (!BazaPodataka.fizickaLica.ContainsKey(fizickoLice.Jmbg))
            {
                BazaPodataka.fizickaLica.Add(fizickoLice.Jmbg, fizickoLice);
            }
            else
            {
                ServisFizickaLicaIzuzetak izuzetak = new ServisFizickaLicaIzuzetak();
                izuzetak.Razlog = "Korisnik sa prosledjenim JMBG-om vec postoji. Nije moguce dodavanje.";
                throw new FaultException<ServisFizickaLicaIzuzetak>(izuzetak);
            }

        }

        public void ObrisiLice(long jmbg)
        {
            if (BazaPodataka.fizickaLica.ContainsKey(jmbg))
            {
                BazaPodataka.fizickaLica.Remove(jmbg);
            }
            else
            {
                ServisFizickaLicaIzuzetak izuzetak = new ServisFizickaLicaIzuzetak();
                izuzetak.Razlog = "Korisnik sa prosledjenim JMBG-om ne postoji. Nije moguce brisanje.";
                throw new FaultException<ServisFizickaLicaIzuzetak>(izuzetak);
            }
        }

        public void IzmeniLice(FizickoLice fizickoLice)
        {
            if (BazaPodataka.fizickaLica.ContainsKey(fizickoLice.Jmbg))
            {
                BazaPodataka.fizickaLica[fizickoLice.Jmbg] = fizickoLice;
            }
            else
            {
                ServisFizickaLicaIzuzetak izuzetak = new ServisFizickaLicaIzuzetak();
                izuzetak.Razlog = "Korisnik sa prosledjenim JMBG-om ne postoji. Nije moguca izmena.";
                throw new FaultException<ServisFizickaLicaIzuzetak>(izuzetak);
            }
        }

        public List<FizickoLice> SpisakLica()
        {

            List<FizickoLice> list = new List<FizickoLice>();

            foreach (FizickoLice f in BazaPodataka.fizickaLica.Values)
            {
                list.Add(f);
            }

            return list;
        }

        public void UpisLica(List<FizickoLice> lica)
        {
            Console.WriteLine(DateTime.Now.ToString() + " - Upis lica iniciran.");

           foreach (FizickoLice f in lica)
           {
                BazaPodataka.fizickaLica[f.Jmbg] = f; // istovremeno radi i dodavanje i azuriranje
           }

            Console.WriteLine($"Replicirano {lica.Count} podataka ");

        }

        public List<FizickoLice> OcitavanjeLica(DateTime vremePoslednjeIzmene)
        {
            Console.WriteLine(DateTime.Now.ToString() + " - Ocitavanje lica inicirano.");

            List<FizickoLice> lica = new List<FizickoLice>();

            foreach (FizickoLice f in BazaPodataka.fizickaLica.Values)
            {
                if(f.VremePoslednjeIzmene >= vremePoslednjeIzmene)
                {
                    lica.Add(f);
                }
            }

            return lica;
        }
    }
}
