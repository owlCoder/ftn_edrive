using NUnit.Framework;
using Common;
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
        [Test]
        [TestCase("Jovana","Milic","1234567891236")]
        [TestCase("Milica", "Milanic", "1234567891236")]

        public void OsobaKonstruktorDobriParametri(string ime, string prezime, string jmbg)
        {
            Osoba.Osoba osoba = new Osoba.Osoba(jmbg, ime, prezime);

            Assert.AreEqual(osoba.Ime, ime);
            Assert.AreEqual(osoba.Prezime, prezime);
            Assert.AreEqual(osoba.Jmbg, jmbg);

            if (int.Parse(jmbg.Substring(9, 3)) >= 500)
            {
                Assert.AreEqual(osoba.PolOsobe, Pol.Zenski);
            }
            else
            {
                Assert.AreEqual(osoba.PolOsobe, Pol.Muski);
            }

        }

        [Test]
        //[ExpectedException(typeof(ArgumentException))]
        [TestCase("","Milic","1234567891321")]
        [TestCase("Jovan", "", "1234567891233")]
        [TestCase("Jovan", "Milic", "")]
        [TestCase("Jovan", "Milic", "123456789")]
        public void OsobaLosiParametri(string ime, string prezime, string jmbg)
        {

            Assert.Throws<ArgumentException>(
                () =>
                {
                    Osoba.Osoba osoba = new Osoba.Osoba(jmbg, ime, prezime);
                });
        }

        [Test]
        //[ExpectedException(typeof(ArgumentNullException))]
        [TestCase(null, "Milic", "1234567891321")]
        [TestCase("Jovan", null, "1234567891233")]
        [TestCase("Jovan", "Milic", null)]
        public void OsobaLosiParametriNull(string ime, string prezime, string jmbg)
        {

            Assert.Throws<ArgumentNullException>(
                () =>
                {
                    Osoba.Osoba osoba = new Osoba.Osoba(jmbg, ime, prezime);
                });
        }

        [Test]
        public void CheckJmbg()
        {
            string dobarJmbg = "1234567891231";
            string losJmbg1 = "absd123456789";
            string losJmbg2 = "123456";

            Osoba.Osoba osoba = new Osoba.Osoba();

            Assert.AreEqual(true, osoba.CheckJmbg(dobarJmbg));
            Assert.AreEqual(false, osoba.CheckJmbg(losJmbg1));
            Assert.AreEqual(false, osoba.CheckJmbg(losJmbg2));

        }
    }
}
