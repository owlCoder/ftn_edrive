using System.ServiceModel;

namespace Common
{
    [ServiceContract]
    public interface IStudentskaSluzba
    {
        [OperationContract]
        [FaultContract(typeof(StudentskaSluzbaIzuzetak))]
        [FaultContract(typeof(BezbedonosniMehanizmiIzuzetak))]
        void DodajStudenta(Student student, string token);

        [OperationContract]
        [FaultContract(typeof(StudentskaSluzbaIzuzetak))]
        [FaultContract(typeof(BezbedonosniMehanizmiIzuzetak))]
        void IzmeniStudenta(Student student, string token);

        [OperationContract]
        [FaultContract(typeof(BezbedonosniMehanizmiIzuzetak))]
        bool PronadjiStudenta(string index, out Student student, string token);

        [OperationContract]
        [FaultContract(typeof(BezbedonosniMehanizmiIzuzetak))]
        bool IzbrisiStudenta(string index, string token);

        [OperationContract]
        int BrojStudenata();
    }
}
