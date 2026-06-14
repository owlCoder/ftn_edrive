using Dummy;
using Moq;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DummyTest
{
    [TestFixture]
    class VehicleTest
    {
        [Test]
        [TestCase(0.0, 60.0)]
        [TestCase(20.0, 40.0)]
        [TestCase(30.0, 80.0)]
        public void DriveTest(double minSpeed, double maxSpeed)
        {
            var road = new Mock<IRoad>();
            Vehicle vehicle = new Vehicle(road.Object);
            // saljemo dummy vrednost samo da potvrdimo da smo uspesno kreirali objekat
            double result = vehicle.Drive(minSpeed, maxSpeed);
            Assert.Less(result, maxSpeed);
            Assert.Greater(result, minSpeed);
        }
    }
}
