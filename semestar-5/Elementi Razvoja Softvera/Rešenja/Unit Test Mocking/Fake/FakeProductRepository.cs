using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fake
{
    public class FakeProductRepository : IProductRepository
    {
        private List<IProduct> _products = new List<IProduct>();
        public void AddProduct(IProduct product)
        {
            _products.Add(product);
        }

        public int GetNumberOFProducts()
        {
            return _products.Count;
        }

        public IProduct GetProduct(int productId)
        {
            IProduct product = _products.FirstOrDefault(p => p.ProductId == productId);
            return product;
        }
    }
}
