using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;
using Common;

namespace Server
{
    class KalkulatorKompleksnihBrojevaServer : IKalkulatorKompleksnihBrojeva
    {
        public KompleksniBroj Podeli(KompleksniBroj k1, KompleksniBroj k2)
        {
            if(k2.RealniDeo == 0 && k2.ImaginarniDeo == 0)
            {
                throw new FaultException<KalkulatorKompleksnihBrojevaIzuzetak>(
                    new KalkulatorKompleksnihBrojevaIzuzetak("Deljenje sa nulom nije dozvoljeno"));
            }

            KompleksniBroj rezultat = new KompleksniBroj();
            long delilac = k2.RealniDeo * k2.RealniDeo + k2.ImaginarniDeo * k2.ImaginarniDeo;
            rezultat.RealniDeo = (k1.RealniDeo * k2.RealniDeo + k1.ImaginarniDeo * k2.ImaginarniDeo) / delilac;
            rezultat.ImaginarniDeo = ( k1.ImaginarniDeo * k2.RealniDeo - k1.RealniDeo * k2.ImaginarniDeo) / delilac;
            return rezultat;
        }

        public KompleksniBroj Pomnozi(KompleksniBroj k1, KompleksniBroj k2)
        {
            KompleksniBroj rezultat = new KompleksniBroj();
            rezultat.RealniDeo = k1.RealniDeo * k2.RealniDeo - k1.ImaginarniDeo * k2.ImaginarniDeo;
            rezultat.ImaginarniDeo = k1.RealniDeo * k2.ImaginarniDeo + k1.ImaginarniDeo * k2.RealniDeo;
            return rezultat;
        }

        public KompleksniBroj Oduzmi(KompleksniBroj k1, KompleksniBroj k2)
        {
            KompleksniBroj rezultat = new KompleksniBroj();
            rezultat.ImaginarniDeo = k1.ImaginarniDeo - k2.ImaginarniDeo;
            rezultat.RealniDeo = k1.RealniDeo - k2.RealniDeo;
            return rezultat;
        }

        public KompleksniBroj Saberi(KompleksniBroj k1, KompleksniBroj k2)
        {
            KompleksniBroj rezultat = new KompleksniBroj();
            rezultat.ImaginarniDeo = k1.ImaginarniDeo + k2.ImaginarniDeo;
            rezultat.RealniDeo = k1.RealniDeo + k2.RealniDeo;
            return rezultat;
        }
    }
}
