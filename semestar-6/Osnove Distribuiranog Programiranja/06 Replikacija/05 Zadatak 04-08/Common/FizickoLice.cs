using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    [DataContract]
    public class FizickoLice
    {
        long jmbg;
        string ime;
        string prezime;
        DateTime vremePoslednjeIzmene;

        [DataMember]
        public long Jmbg
        {
            get
            {
                return jmbg;
            }

            set
            {
                jmbg = value;
            }
        }

        [DataMember]
        public string Ime
        {
            get
            {
                return ime;
            }

            set
            {
                ime = value;
            }
        }

        [DataMember]
        public string Prezime
        {
            get
            {
                return prezime;
            }

            set
            {
                prezime = value;
            }
        }

        [DataMember]
        public DateTime VremePoslednjeIzmene
        {
            get
            {
                return vremePoslednjeIzmene;
            }

            set
            {
                vremePoslednjeIzmene = value;
            }
        }

        public FizickoLice(long jmbg, string ime, string prezime, DateTime vremePoslednjeIzmene)
        {
            this.jmbg = jmbg;
            this.ime = ime;
            this.prezime = prezime;
            this.vremePoslednjeIzmene = vremePoslednjeIzmene;
        }

        public FizickoLice() : this(0, "", "", new DateTime()) { }

        public override string ToString()
        {
            return $"JMBG : {jmbg}, ime i prezime : {ime} {prezime}";
        }
    }
}
