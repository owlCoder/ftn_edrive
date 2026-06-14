using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mock
{
    public class Helper
    {
        private ILogger _logger;
        public Helper(ILogger logger)
        {
            _logger = logger;
        }
        public void WriteToFile(string message)
        {
            _logger.Info(message);
        }
    }
}
