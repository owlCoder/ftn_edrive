using System.Runtime.Serialization;

namespace Common
{
    [DataContract]
    public class BezbedonosniMehanizmiIzuzetak
    {
        string razlog;

        [DataMember]
        public string Razlog { get => razlog; set => razlog = value; }

        public BezbedonosniMehanizmiIzuzetak(string poruka = "")
        {
            Razlog = poruka;
        }
    }
}
