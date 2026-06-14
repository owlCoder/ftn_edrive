using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;

namespace Common
{
    [DataContract]
    public class FizickoLice
    {
        long jmbg;
        string ime;
        string prezime;

        public FizickoLice(long jmbg, string ime, string prezime)
        {
            this.jmbg = jmbg;
            this.ime = ime;
            this.prezime = prezime;
        }

        [DataMember]
        public long Jmbg { get => jmbg; set => jmbg = value; }
        [DataMember]
        public string Ime { get => ime; set => ime = value; }
        [DataMember]
        public string Prezime { get => prezime; set => prezime = value; }

        public override string ToString()
        {
            return $"{jmbg} : {ime} {prezime}";
        }
    }
}
