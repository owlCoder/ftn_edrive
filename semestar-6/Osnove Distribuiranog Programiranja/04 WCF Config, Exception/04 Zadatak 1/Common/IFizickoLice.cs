using System.Collections.Generic;
using System.ServiceModel;

namespace Common
{
    [ServiceContract]
    public interface IFizickoLice
    {
        [OperationContract]
        void DodajLice(FizickoLice lice);

        [OperationContract]
        void ObrisiLice(long jmbg);

        [OperationContract]
        List<FizickoLice> SpisakLica();
    }
}
