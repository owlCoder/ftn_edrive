using System.ServiceModel;

namespace Common
{
    [ServiceContract]
    public interface IBezbedonosniMehanizmi
    {
        [OperationContract]
        [FaultContract(typeof(BezbedonosniMehanizmiIzuzetak))]
        string Autentifikacija(string korisnickoIme, string lozinka);
    }
}
