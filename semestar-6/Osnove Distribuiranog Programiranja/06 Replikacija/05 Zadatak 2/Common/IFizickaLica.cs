using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ServiceModel;

namespace Common
{
    [ServiceContract]
    public interface IFizickaLica
    {
        [OperationContract]
        [FaultContract(typeof(ServisFizickihLicaIzuzetak))]
        [FaultContract(typeof(BezbednosniIzuzetak))]
        void DodajLice(FizickoLice fizickoLice, string token);

        [OperationContract]
        [FaultContract(typeof(ServisFizickihLicaIzuzetak))]
        [FaultContract(typeof(BezbednosniIzuzetak))]
        void ObrisiLice(long jmbg, string token);

        [OperationContract]
        [FaultContract(typeof(BezbednosniIzuzetak))]
        List<FizickoLice> SpisakLica(string token);

        [OperationContract]
        List<FizickoLice> OcitavanjeLica();

        [OperationContract]
        void UpisLica(List<FizickoLice> lica);
    }
}
