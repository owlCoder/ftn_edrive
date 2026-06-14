using Fake;
using Moq;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StubTest
{
    [TestFixture]
    class ShoppingCartTest
    {
        private const int _ID = 1;
        private IProduct _product;
        private IProductRepository _productRepository;

        [SetUp]
        public void SetUp()
        {
            Mock<IProduct> productDouble = new Mock<IProduct>();
            productDouble.Setup(_product => _product.ProductId).Returns(_ID);
            _product = productDouble.Object;

            _productRepository = new FakeProductRepository();
            _productRepository.AddProduct(_product);
        }

        [Test]
        public void AddToCarGoodProduct()
        {
            ShoppingCart shoppingCart = new ShoppingCart(_productRepository);
            IProduct product = shoppingCart.GetProductById(_ID);
            Assert.IsNotNull(product);
        }

        [TearDown]
        public void TearDown()
        {
            _product = null;
        }
    }
}
