using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ServiceModel;

namespace Common
{
    [ServiceContract]

    public interface IKalkulatorKompleksnihBrojeva
    {
        [OperationContract]
        KompleksniBroj Saberi(KompleksniBroj k1, KompleksniBroj k2);

        [OperationContract]
        KompleksniBroj Oduzmi(KompleksniBroj k1, KompleksniBroj k2);

        [OperationContract]
        [FaultContract(typeof(KalkulatorKompleksnihBrojevaIzuzetak))]
        KompleksniBroj Podeli(KompleksniBroj k1, KompleksniBroj k2);

        [OperationContract]
        KompleksniBroj Pomnozi(KompleksniBroj k1, KompleksniBroj k2);
    }
}
