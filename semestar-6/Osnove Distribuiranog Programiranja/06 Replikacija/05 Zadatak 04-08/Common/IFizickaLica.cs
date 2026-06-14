using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;


namespace Common
{
    [ServiceContract]
    public interface IFizickaLica
    {
        [OperationContract]
        [FaultContract(typeof(ServisFizickaLicaIzuzetak))]
        void DodajLice(FizickoLice fizickoLice);

        [OperationContract]
        [FaultContract(typeof(ServisFizickaLicaIzuzetak))]
        void ObrisiLice(long jmbg);

        [OperationContract]
        [FaultContract(typeof(ServisFizickaLicaIzuzetak))]
        void IzmeniLice(FizickoLice fizickoLice);

        [OperationContract]
        List<FizickoLice> SpisakLica();

        [OperationContract]
        [FaultContract(typeof(ServisFizickaLicaIzuzetak))]
        List<FizickoLice> OcitavanjeLica(DateTime vremePoslednjeIzmene);

        [OperationContract]
        [FaultContract(typeof(ServisFizickaLicaIzuzetak))]
        void UpisLica(List<FizickoLice> lica);
    }
}
