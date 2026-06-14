using System.Runtime.Serialization;

namespace Common
{
    [DataContract]
    public class FizickoLice
    {
        [DataMember]
        public long Jmbg { get; set; }
        [DataMember]
        public string Ime { get; set; }
        [DataMember]
        public string Prezime { get; set; }

        public FizickoLice(long jmbg, string ime, string prezime)
        {
            Jmbg = jmbg;
            Ime = ime;
            Prezime = prezime;
        }

        public override string ToString()
        {
            return string.Format("{0} {1} {2}\n", Jmbg, Ime, Prezime);
        }
    }
}
