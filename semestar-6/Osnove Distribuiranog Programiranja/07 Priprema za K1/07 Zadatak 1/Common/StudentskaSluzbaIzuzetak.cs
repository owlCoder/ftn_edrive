using System.Runtime.Serialization;

namespace Common
{
    [DataContract]
    public class StudentskaSluzbaIzuzetak
    {
        string razlog;

        [DataMember]
        public string Razlog { get => razlog; set => razlog = value; }

        public StudentskaSluzbaIzuzetak(string poruka = "")
        {
            Razlog = poruka;
        }
    }
}
