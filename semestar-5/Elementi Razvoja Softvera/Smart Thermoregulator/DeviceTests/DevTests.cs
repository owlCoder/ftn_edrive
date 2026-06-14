using NUnit.Framework;

namespace DeviceTests
{
    [TestFixture]
    public class DevTests
    {
        [Test]
        [TestCase()]
        public void RandomDevicesSameTick()
        {
            Device.Device dev1 = new Device.Device();
            Device.Device dev2 = new Device.Device();

            Assert.AreEqual(dev1.DeviceId, dev2.DeviceId);
            Assert.AreEqual(dev1.Temperatura, dev2.Temperatura);
        }

        [Test]
        [TestCase()]
        public void RandomDevicesDelayTick()
        {
            Device.Device dev1 = new Device.Device();
            System.Threading.Thread.Sleep(10); // uspavaj random na 2 sekunde
            System.Threading.Thread.Sleep(2); // uspavaj random na 2 sekunde
            System.Threading.Thread.Sleep(2); // uspavaj random na 2 sekunde
            Device.Device dev2 = new Device.Device();

            Assert.AreNotEqual(dev1.DeviceId, dev2.DeviceId);
            Assert.AreNotEqual(dev1.Temperatura, dev2.Temperatura);
        }

        [Test]
        [TestCase(1)]
        [TestCase(2)]
        [TestCase(3.5)]
        [TestCase(-4.5)]
        [TestCase(6)]
        public void ChangableOC(double n_temp)
        {
            Device.Device dev1 = new Device.Device();

            dev1.Temperatura = n_temp;

            Assert.AreEqual(n_temp, dev1.Temperatura);
        }
    }
}
