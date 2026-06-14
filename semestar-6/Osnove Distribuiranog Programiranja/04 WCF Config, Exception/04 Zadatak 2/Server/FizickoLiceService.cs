using Common;
using System;
using System.Collections.Generic;
using System.ServiceModel;

namespace Server
{
    public class FizickoLiceService : IFizickoLice
    {
        private static Dictionary<long, FizickoLice> Database = new Dictionary<long, FizickoLice>();
        public FizickoLiceService() { }

        public void DodajLice(FizickoLice lice)
        {
            if (lice != null)
            {
                FizickoLice temp;
                if (!Database.TryGetValue(lice.Jmbg, out temp))
                {
                    Database.Add(lice.Jmbg, lice);
                    Console.WriteLine("[SERVER] Fizicko lice dodato u bazu podataka!");
                }
                else
                {
                    ServisFizickaLicaIzuzetak iz = new ServisFizickaLicaIzuzetak()
                    {
                        Razlog = "[SERVER] Fizičko lice sa navedenim JMBG-om postoji."
                    };

                    throw new FaultException<ServisFizickaLicaIzuzetak>(iz);
                }
            }
            else
            {
                ServisFizickaLicaIzuzetak iz = new ServisFizickaLicaIzuzetak()
                {
                    Razlog = "[SERVER] Fizičko lice nije inicijalizovano na instacu objekta klase."
                };

                throw new FaultException<ServisFizickaLicaIzuzetak>(iz);
            }
        }

        public void ObrisiLice(long jmbg)
        {
            FizickoLice temp;
            if (Database.TryGetValue(jmbg, out temp))
            {
                Database.Remove(jmbg);
                Console.WriteLine("[SERVER] Fizicko lice obrisano iz baze podataka!");
            }
            else
            {
                ServisFizickaLicaIzuzetak iz = new ServisFizickaLicaIzuzetak()
                {
                    Razlog = "[SERVER] Fizičko lice sa navedenim JMBG-om ne postoji."
                };

                throw new FaultException<ServisFizickaLicaIzuzetak>(iz);
            }
        }

        public List<FizickoLice> SpisakLica()
        {
            List<FizickoLice> lica = new List<FizickoLice>();

            foreach (FizickoLice fl in Database.Values)
            {
                lica.Add(fl);
            }

            return lica;
        }
    }
}
