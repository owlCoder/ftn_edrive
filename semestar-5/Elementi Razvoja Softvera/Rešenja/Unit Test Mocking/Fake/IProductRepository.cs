using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fake
{
    public interface IProductRepository
    {
        void AddProduct(IProduct product);

        IProduct GetProduct(int productId);

        int GetNumberOFProducts();
    }
}
