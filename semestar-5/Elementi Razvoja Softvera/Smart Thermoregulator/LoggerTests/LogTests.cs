using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logger;
using NUnit.Framework;

namespace LoggerTests
{
    [TestFixture]
    public class LogTests
    {
        [Test]
        [TestCase(null)]
        public void NUllExc(string name)
        {
            Assert.Throws<ArgumentNullException>(
            () =>
            {
                Log log = new Log(name);
            });
        }

        [Test]
        [TestCase("")]
        public void EmptyEx(string name)
        {
            Assert.Throws<ArgumentException>(
            () =>
            {
                Log log = new Log(name);
            });
        }

        [Test]
        [TestCase("poruka")]
        public void Oktest(string name)
        {
            Log log = new Log(name);

            Assert.AreEqual(name, log.Poruka_za_upis);
        }

        [Test]
        [TestCase("")]
        public void Infolog(string name)
        {
            new LogUFajl(name);
        }

        // logporuka
        [Test]
        [TestCase(null)]
        public void lognull(string name)
        {
            Assert.Throws<ArgumentNullException>(
            () =>
            {
                Log log = new Log(name);
            });
        }

        [Test]
        [TestCase("")]
        public void logemp(string name)
        {
            Assert.Throws<ArgumentException>(
            () =>
            {
                Log log = new Log(name);
            });
        }

        [Test]
        [TestCase("poruka")]
        public void OKLog(string name)
        {
            Log log = new Log(name);

            Assert.AreEqual(name, log.Poruka_za_upis);
        }
    }
}
