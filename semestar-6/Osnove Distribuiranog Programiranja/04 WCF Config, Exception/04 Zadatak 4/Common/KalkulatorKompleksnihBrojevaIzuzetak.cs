using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    [DataContract]
    public class KalkulatorKompleksnihBrojevaIzuzetak
    {
        string razlog;

        public KalkulatorKompleksnihBrojevaIzuzetak(string razlog)
        {
            Razlog = razlog;
        }
        [DataMember]
        public string Razlog { get => razlog; set => razlog = value; }
    }
}
