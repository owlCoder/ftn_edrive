using System.ServiceModel;

namespace Common
{
    [ServiceContract]
    public interface IFizickaLica
    {
        [OperationContract]
        void DodajLice(long jmbg, string ime, string prezime);

        [OperationContract]
        void ObrisiLice(long jmbg);

        [OperationContract]
        string SpisakLica();
    }
}
