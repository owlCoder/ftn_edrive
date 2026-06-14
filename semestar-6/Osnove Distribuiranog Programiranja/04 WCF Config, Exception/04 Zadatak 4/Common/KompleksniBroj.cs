using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;

namespace Common
{
    [DataContract]
    public class KompleksniBroj
    {
        long imaginarniDeo;
        long realniDeo;

        public KompleksniBroj() : this(0, 0) { }

        public KompleksniBroj(long realniDeo, long imaginarniDeo)
        {
            this.ImaginarniDeo = imaginarniDeo;
            this.RealniDeo = realniDeo;
        }

        [DataMember]
        public long ImaginarniDeo { get => imaginarniDeo; set => imaginarniDeo = value; }
        [DataMember]
        public long RealniDeo { get => realniDeo; set => realniDeo = value; }

        public override string ToString()
        {
            string s = "";

            if (realniDeo == 0 && imaginarniDeo == 0)
            {
                return 0.ToString();
            }

            if (realniDeo!=0)
            {
                s += realniDeo;
            }

            if(imaginarniDeo != 0)
            {
                if(imaginarniDeo > 0)
                {
                    s += " +i" + imaginarniDeo;
                    
                } else
                {
                    s += " -i" + Math.Abs(imaginarniDeo);
                }
                return s;
            }

            return s;

        }
    }
}
