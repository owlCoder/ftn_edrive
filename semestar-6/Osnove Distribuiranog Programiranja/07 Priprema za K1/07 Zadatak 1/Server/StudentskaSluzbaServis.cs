using Common;
using System;
using System.Collections.Generic;
using System.ServiceModel;

namespace Server
{
    public class StudentskaSluzbaServis : IStudentskaSluzba, IBezbedonosniMehanizmi
    {
        public static Dictionary<string, Student> studenti = new Dictionary<string, Student>();
        static DirektorijumKorisnika direktorijum = new DirektorijumKorisnika();

        public string Autentifikacija(string korisnickoIme, string lozinka)
        {
            return direktorijum.AutentifikacijaKorisnika(korisnickoIme, lozinka);
        }

        public void DodajStudenta(Student student, string token)
        {
            direktorijum.KorisnikAutentifikovanIAutorizovan(token, EPravaPristupa.Modifikacija);

            if (!studenti.ContainsKey(student.BrojIndeksa))
            {
                student.PoslednjaIzmena = DateTime.Now;
                studenti.Add(student.BrojIndeksa, student);
                return;
            }

            throw new FaultException<StudentskaSluzbaIzuzetak>(
                  new StudentskaSluzbaIzuzetak("Student sa unetim brojem indeksa vec postoji!"));
        }

        public bool IzbrisiStudenta(string index, string token)
        {
            direktorijum.KorisnikAutentifikovanIAutorizovan(token, EPravaPristupa.Brisanje);

            if (studenti.ContainsKey(index))
            {
                studenti.Remove(index);
                return true;
            }
            else
            {
                return false;
            }
        }

        public void IzmeniStudenta(Student student, string token)
        {
            direktorijum.KorisnikAutentifikovanIAutorizovan(token, EPravaPristupa.Modifikacija);

            if (studenti.ContainsKey(student.BrojIndeksa))
            {
                student.PoslednjaIzmena = DateTime.Now;
                studenti[student.BrojIndeksa] = student;
                return;
            }

            throw new FaultException<StudentskaSluzbaIzuzetak>(
                  new StudentskaSluzbaIzuzetak("Student sa unetim brojem indeksa ne postoji!"));
        }

        public bool PronadjiStudenta(string index, out Student student, string token)
        {
            direktorijum.KorisnikAutentifikovanIAutorizovan(token, EPravaPristupa.Citanje);

            return studenti.TryGetValue(index, out student);
        }

        public int BrojStudenata() { return studenti.Count; }
    }
}
