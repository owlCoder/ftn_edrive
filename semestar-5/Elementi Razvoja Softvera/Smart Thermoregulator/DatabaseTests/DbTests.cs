using Database.Implementacije;
using Database.Interfejsi;
using Moq;
using NUnit.Framework;
using System.Data;

namespace DatabaseTests
{
    [TestFixture]
    public class DbTests
    {
        // check db connection
        [Test]
        [TestCase()]
        public void DbConnectionOk()
        {
            Assert.NotNull(DatabaseConnection.GetConnection());
        }

        // mock db write ok
        [Test]
        [TestCase(12, "5.1.2022. 10:30", 45.62)]
        [TestCase(12, "5.1.2022. 10:30", 12)]
        [TestCase(12, "5.1.2022. 10:30", 3)]
        [TestCase(12, "5.1.2022. 10:30", 521)]
        [TestCase(12, "5.1.2022. 10:30", 2351)]
        public void ValidMockWriteDb(int radioSati, string datum, decimal potrosenoKw)
        {
            Mock<IWriteHeaterData> mock = new Mock<IWriteHeaterData>();

            mock.Setup(p => p.Evidencija(radioSati, datum, potrosenoKw)).Returns(true); // treba upis da prodje ok
        }

        // mock db write ok
        [Test]
        [TestCase("12", "5.1.2022. 10:30", 45.62)]
        [TestCase(-55, "", 3)]
        [TestCase(-55, "", 21.54)]
        [TestCase(12, "5.1.2022. 10:30", "5")]
        public void InvalidMockWriteDb(int radioSati, string datum, decimal potrosenoKw)
        {
            Mock<IWriteHeaterData> mock = new Mock<IWriteHeaterData>();

            mock.Setup(p => p.Evidencija(radioSati, datum, potrosenoKw)).Returns(false); // treba upis da prodje ok
        }

        [Test]
        [TestCase()]
        public void DisposableTest()
        {
            using (IDbConnection kon = DatabaseConnection.GetConnection())
            {
                kon.Open();

                kon.Dispose();
            }

            var db = new DatabaseConnection();
            db.Dispose();
            Assert.AreEqual(true, DatabaseConnection.GetInstance());
        }
    }
}
