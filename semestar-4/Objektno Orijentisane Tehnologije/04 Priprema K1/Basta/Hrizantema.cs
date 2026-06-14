using System;

namespace Basta
{
    [Serializable]
    class Hrizantema : Ruza 
    {
        private double sirinaLatice;
        private string boja;
        private int prosecanBrojCvetova;
 
        public Hrizantema() : base()
        {
            SirinaLatice = 0;
            Boja = "/";
            ProsecanBrojCvetova = 0;
        }

        public Hrizantema(string naziv, string vrsta, int starost, bool zalivena, double sirinaLatice, string boja, int prosecanBrojCvetova) : base(naziv, vrsta, starost, zalivena)
        {
            SirinaLatice = sirinaLatice;
            Boja = boja;
            ProsecanBrojCvetova = prosecanBrojCvetova;
        }

        public double SirinaLatice { get => sirinaLatice; set => sirinaLatice = value; }
        public string Boja { get => boja; set => boja = value; }
        public int ProsecanBrojCvetova { get => prosecanBrojCvetova; set => prosecanBrojCvetova = value; }
        public override bool Equals(object obj)
        {
            return obj is Hrizantema hrizantema &&
                   Naziv == hrizantema.Naziv &&
                   Vrsta == hrizantema.Vrsta &&
                   Starost == hrizantema.Starost &&
                   Zalivena == hrizantema.Zalivena &&
                   SirinaLatice == hrizantema.SirinaLatice &&
                   Boja == hrizantema.Boja &&
                   ProsecanBrojCvetova == hrizantema.ProsecanBrojCvetova;
        }

        public override string ToString()
        {
            return "------------------- HRIZANTEMA -------------------\n\tNaziv: " + Naziv + "\n\tVrsta: " + Vrsta + "\n\tStarost: " + Starost + " meseci\n\t" +
                        "Zalivena: " + (Zalivena == true ? "DA" : "NE") +
                        "\n\tSirina latice: " + SirinaLatice + "cm\n\tBoja:" + Boja
                        + "\n\tProsecan Broj Cvetova: " + ProsecanBrojCvetova + " cvetova\n";
        }
        public override int GetHashCode()
        {
            return base.GetHashCode();
        }
    }
}
