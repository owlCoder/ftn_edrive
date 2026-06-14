using Fake;
using Moq;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FakeTest
{
    [TestFixture]
    class ShoppingCartTest
    {
        private const int _ID = 1;
        private const int _NUMBER_OF_PRODUCT = 1;
        private IProduct _product;
        [SetUp]
        public void SetUp()
        {
            Mock<IProduct> productDouble = new Mock<IProduct>();
            _product = productDouble.Object;
        }

        [Test]
        public void AddToCarGoodProduct()
        {
            IProductRepository productRepository = new FakeProductRepository();
            ShoppingCart shoppingCart = new ShoppingCart(productRepository);
            shoppingCart.AddToCart(_product);
            Assert.AreEqual(_NUMBER_OF_PRODUCT, shoppingCart.GetNumberOfProductsInCart());
        }

        [TearDown]
        public void TearDown()
        {
            _product = null;
        }
    }
}
