namespace Zadatak_2
{
    public abstract class Racun
    {
        public int IdRacuna { get; set; }
        public double Stanje { get; set; }
        public abstract bool Uplata(double iznos);
        public abstract bool Isplata(double iznos);
        public override string ToString()
        {
            return string.Format("   Id racuna: {0}\n   Stanje: {1} ", IdRacuna, Stanje);
        }
    }
}
