using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    [DataContract]
    public class ServisFizickaLicaIzuzetak
    {
        [DataMember]
        public string Razlog { get => razlog; set => razlog = value; }
        private string razlog;
    }
}
