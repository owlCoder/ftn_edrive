using System;
using System.Runtime.Serialization;

namespace Common
{
    [DataContract]
    public class Student
    {
        string ime;
        string prezime;
        string brojIndeksa;
        DateTime poslednjaIzmena;

        public Student(string ime, string prezime, string brojIndeksa)
        {
            Ime = ime;
            Prezime = prezime;
            BrojIndeksa = brojIndeksa;
            PoslednjaIzmena = DateTime.Now;
        }

        [DataMember]
        public string Ime { get => ime; set => ime = value; }

        [DataMember]
        public string Prezime { get => prezime; set => prezime = value; }

        [DataMember]
        public string BrojIndeksa { get => brojIndeksa; set => brojIndeksa = value; }

        [DataMember]
        public DateTime PoslednjaIzmena { get => poslednjaIzmena; set => poslednjaIzmena = value; }
    }
}
