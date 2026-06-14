using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace HeaterTests
{
    [TestFixture]
    public class HeatTests
    {
        [Test]
        [TestCase()]
        public void OkConstrucotor()
        {
            Heater.Heater heater = new Heater.Heater();
            Heater.Heater heater2 = new Heater.Heater();

            Assert.AreEqual(heater.IsHeaterOn, heater2.IsHeaterOn);
        }

        [Test]
        [TestCase()]
        public void StartHeat()
        {
            Heater.Heater heater = new Heater.Heater();
            Device.Device dev = new Device.Device();
            var lista = new List<Device.Device>
            {
                dev
            };

            heater.devices = lista;

            heater.IsHeaterOn = true;
            heater.PokreniZagrevanje();

            Assert.AreEqual(true, heater.IsHeaterOn); // ukljucio se grejac
        }

        public void OffHeat()
        {
            Heater.Heater heater = new Heater.Heater();
            Device.Device dev = new Device.Device();
            var lista = new List<Device.Device>
            {
                dev
            };

            heater.devices = lista;

            heater.IsHeaterOn = false;
            heater.PokreniZagrevanje();
            heater.Evidencija();

            Assert.AreEqual(false, heater.IsHeaterOn); // ukljucio se grejac
        }

        public void EmptyList()
        {
            Assert.Throws<ArgumentNullException>(
            () =>
            {
                Heater.Heater heater = new Heater.Heater();
                Device.Device dev = new Device.Device();

                heater.IsHeaterOn = false;
                heater.PokreniZagrevanje();
                heater.Evidencija();

                Assert.AreEqual(false, heater.IsHeaterOn); // ukljucio se grejac
            });
        }
    }
}
