using Heater;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RegulatorTests
{
    [TestFixture]
    public class RegTests
    {
        [Test]
        [TestCase()]
        public void OkConstr()
        {
            Regulator regulator = new Regulator();
        }

        [Test]
        [TestCase()]
        public void RegulisiOk()
        {
            Regulator regulator = new Regulator();
            regulator.Regulacija();
        }
    }
}
