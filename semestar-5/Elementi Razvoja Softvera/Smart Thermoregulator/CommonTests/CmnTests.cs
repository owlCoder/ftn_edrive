using Common.Implementacije;
using NUnit.Framework;

namespace CommonTests
{
    [TestFixture]
    public class CmnTests
    {
        [Test]
        [TestCase()]
        public void OkayDevices()
        {
            DeviceCollection deviceCollection = new DeviceCollection();
            for (int i = 0; i < 4; i++)
            {
                Assert.AreEqual(true, deviceCollection.AddDevice());
            }
        }

        [Test]
        [TestCase()]
        public void ReachLimit()
        {
            DeviceCollection deviceCollection = new DeviceCollection();
            for (int i = 0; i < 10; i++)
            {
                Assert.AreEqual(true, deviceCollection.AddDevice());
            }

            Assert.AreEqual(false, deviceCollection.AddDevice()); // capped limit of 9 devices
        }
        
        [Test]
        [TestCase()]
        public void EmptyCollection()
        {
            DeviceCollection deviceCollection = new DeviceCollection();

            Assert.AreEqual(0, deviceCollection.GetDevices().Count);
        }
    }
}
