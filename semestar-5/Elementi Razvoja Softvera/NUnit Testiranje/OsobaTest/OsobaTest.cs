using Common;
using NUnit.Framework;
using Osoba;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OsobaTest
{
    [TestFixture]
    public class OsobaTest
    {
        public OsobaTest()
        {
            // Prazan konstruktor
        }

        [Test]
        [TestCase ("Jovana", "Milic", "19010001521412")]
        [TestCase ("Milica", "Jovanovic", "2305998321452")]

        public void OsobaKonstruktorDobriParametri(string ime, string prezime, string jmbg)
        {
            Osoba.Osoba osoba = new Osoba.Osoba(jmbg, ime, prezime);

            Assert.AreEqual(osoba.Ime, ime);
            Assert.AreEqual(osoba.Prezime, prezime);
            Assert.AreEqual(osoba.JMBG, jmbg);

            if(int.Parse(jmbg.Substring(9, 3)) >= 500)
            {
                Assert.AreEqual(osoba.PolOsobe, Pol.ZENSKI);
            }
            else
            {
                Assert.AreEqual(osoba.PolOsobe, Pol.MUSKI);
            }
        }

        [Test]
        [TestCase ("", "Milic", "19010001521412")]
        [TestCase ("Danijel", "", "19010001536512")]
        [TestCase ("Milena", "Ivic", "")]
        [TestCase ("Anita", "Milic", "1901005412")]
        public void OsobaLosiParametri(string ime, string prezime, string jmbg)
        {
            Assert.Throws<ArgumentException>(
                () =>
                {
                    Osoba.Osoba osoba = new Osoba.Osoba(jmbg, ime, prezime);
                }
            );
        }

        [Test]
        [TestCase (null, "Jovanovic", "1901001528489")]
        [TestCase ("Danijel", null, "1901001528489")]
        [TestCase ("Danijel", "Jovanovic", null)]
        public void OsobaLosiParametriNull(string ime, string prezime, string jmbg)
        {
            Assert.Throws<ArgumentNullException>(
               () =>
               {
                   Osoba.Osoba osoba = new Osoba.Osoba(jmbg, ime, prezime);
               }
           );
        }

        [Test]
        public void ProveriJMBG()
        {
            string dobarJmbg = "1901001521456";
            string losJmbg = "dd21254165632";
            string nullJmbg = null;

            Osoba.Osoba osoba = new Osoba.Osoba();

            Assert.AreEqual(true, osoba.ProveraJMBG(dobarJmbg));
            Assert.AreEqual(false, osoba.ProveraJMBG(losJmbg));
            Assert.AreEqual(false, osoba.ProveraJMBG(nullJmbg));
        }

        [Test]
        public void ProveraIme()
        {
            string dobarIme = "Danijel";
            string losIme = "";
            string nullIme = null;

            Osoba.Osoba osoba = new Osoba.Osoba();

            Assert.AreEqual(true, osoba.ProveraIme(dobarIme));
            Assert.AreEqual(false, osoba.ProveraIme(losIme));
            Assert.AreEqual(false, osoba.ProveraIme(nullIme));
        }

        [Test]
        public void ProveraPrezime()
        {
            string dobarPrezime = "Jovanovic";
            string losPrezime = "";
            string nullPrezime = null;

            Osoba.Osoba osoba = new Osoba.Osoba();

            Assert.AreEqual(true, osoba.ProveraPrezime(dobarPrezime));
            Assert.AreEqual(false, osoba.ProveraPrezime(losPrezime));
            Assert.AreEqual(false, osoba.ProveraPrezime(nullPrezime));
        }
    }
}
