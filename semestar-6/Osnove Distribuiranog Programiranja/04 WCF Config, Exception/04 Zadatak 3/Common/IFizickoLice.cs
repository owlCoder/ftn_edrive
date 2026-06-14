using System.Collections.Generic;
using System.ServiceModel;

namespace Common
{
    [ServiceContract]
    public interface IFizickoLice
    {
        [OperationContract]
        [FaultContract(typeof(ServisFizickaLicaIzuzetak))]
        void DodajLice(FizickoLice lice);

        [OperationContract]
        [FaultContract(typeof(ServisFizickaLicaIzuzetak))]
        void ObrisiLice(long jmbg);

        [OperationContract]
        List<FizickoLice> SpisakLica();
    }
}
