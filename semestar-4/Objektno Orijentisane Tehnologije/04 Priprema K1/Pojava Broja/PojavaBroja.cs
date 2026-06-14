namespace Pojava_Broja
{
    class PojavaBroja
    {
        private int broj;
        private int noEl;

        public PojavaBroja()
        {
            this.Broj = 0;
            this.NoEl = 0;
        }

        public PojavaBroja(int broj, int noEl)
        {
            this.Broj = broj;
            this.NoEl = noEl;
        }
        public int Broj { get => broj; set => broj = value; }
        public int NoEl { get => noEl; set => noEl = value; }

        public override bool Equals(object obj)
        {
            return obj is PojavaBroja broja &&
                   Broj == broja.Broj &&
                   NoEl == broja.NoEl;
        }
        public override string ToString()
        {
            return "(" + broj + ", " + noEl + ")";
        }

        // METODA KOJA SLUZI SAMO DA SKLONI WARNING...
        public override int GetHashCode()
        {
            return base.GetHashCode();
        }
    }
}
