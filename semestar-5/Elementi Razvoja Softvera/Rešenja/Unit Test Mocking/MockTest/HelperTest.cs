using Mock;
using Moq;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockTest
{
    [TestFixture]
    class HelperTest
    {
        [Test]
        [TestCase("Neka poruka")]
        public void WriteToFileMockVerify(string message)
        {
            Mock<ILogger> loggerMock = new Mock<ILogger>();
            // sa verifiable kazemo da hocemo posle da mozemo da verifikujemo
            // da li se poziv zaista desio
            loggerMock.Setup(_logger => _logger.Info(message)).Verifiable();
            Helper helper = new Helper(loggerMock.Object);
            helper.WriteToFile(message);
            loggerMock.Verify(_logger => _logger.Info(message), Times.Once);
        }
    }
}
