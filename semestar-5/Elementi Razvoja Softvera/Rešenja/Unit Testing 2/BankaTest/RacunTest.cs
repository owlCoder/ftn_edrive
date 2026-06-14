using Banka;
using Common;
using Moq;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BankaTest
{
    [TestFixture]
    public class RacunTest
    {
        IOsoba _osoba;
        [SetUp]
        public void SetUp()
        {
            var moq = new Mock<IOsoba>();
            moq.Setup(o => o.Jmbg).Returns("1111111111111");
            _osoba = moq.Object;
        }

        [Test]
        [TestCase(10.0)]
        [TestCase(120.0)]
        public void RacunKonstruktorDobriParametri(Decimal dozvoljeniMinus)
        {
            Racun racun = new Racun(_osoba, "111" + _osoba.Jmbg + "001", dozvoljeniMinus);

            Assert.AreEqual(racun.Vlasnik, _osoba);
            Assert.AreEqual(racun.BrojRacuna, "111" + _osoba.Jmbg + "001");
            Assert.AreEqual(racun.DozvoljeniMinus, dozvoljeniMinus);
            Assert.AreEqual(racun.Stanje, 0);
        }

        [Test]
        public void RacunKonstruktorLosiParametriNull1()
        {
            Assert.Throws<ArgumentNullException>
                (() =>
                {
                    Racun racun = new Racun(null, "111" + _osoba.Jmbg + "001", 100);
                });
        }

        [Test]
        public void RacunKonstruktorLosiParametriNull2()
        {
            Assert.Throws<ArgumentNullException>
                (() =>
                {
                    Racun racun = new Racun(_osoba, null, 100);
                });
        }
        [Test]
        [TestCase(-1.2)]
        [TestCase(-152.2)]
        public void RacunKonstruktorLosiParametriDozvoljeniMInus(Decimal dozvoljeniMinus)
        {
            Assert.Throws<ArgumentException>(
                () =>
                {
                    Racun r = new Racun(_osoba, "111" + _osoba.Jmbg + "111", dozvoljeniMinus);
                });
        }

        [Test]
        [TestCase("12345678")]
        [TestCase("22222222222222222")]
        [TestCase("00011111111111111")]
        [TestCase("01111111111111111")]
        [TestCase("10011111111111111")]
        [TestCase("11011111111111111")]
        public void RacunKonstruktorLosiParametriBrojRacuna(string brojRacuna)
        {
            Assert.Throws<ArgumentException>(
                () =>
                {
                    Racun r = new Racun(_osoba, brojRacuna, 150);
                });
        
        }
    }
}
