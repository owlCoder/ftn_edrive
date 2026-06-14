using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fake
{
    public class ShoppingCart
    {
        private IProductRepository _productRepository;

        public ShoppingCart(IProductRepository productRepository)
        {
            this._productRepository = productRepository;
        }

        public void AddToCart(IProduct product)
        {
            _productRepository.AddProduct(product);
        }

        public int GetNumberOfProductsInCart()
        {
            return _productRepository.GetNumberOFProducts();
        }

        public IProduct GetProductById(int productId)
        {
            return _productRepository.GetProduct(productId);
        }

    }
}
