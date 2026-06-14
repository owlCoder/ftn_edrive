using System;

namespace Zadatak_2
{
    public class DevizniRacun : Racun
    {
        private static readonly double provizijaUplata = 0.05;
        private static readonly double provizijaIsplata = 0.05;
        public DevizniRacun(double stanje)
        {
            IdRacuna = new Random().Next(1, 100);
            Stanje = stanje;
        }
        public override bool Isplata(double iznos)
        {
            if (Stanje - iznos < 0.0)
            {
                return false;
            }
            else
            {
                Stanje -= iznos + (iznos * provizijaIsplata);
                return true;
            }
        }

        public override bool Uplata(double iznos)
        {
            Stanje += iznos - (iznos * provizijaUplata);
            return true;
        }
        public override string ToString()
        {
            return "Devizni racun\n" + base.ToString() + "EUR\n";
        }
    }
}
