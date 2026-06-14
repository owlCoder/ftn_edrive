using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z1
{
    public class Krug
    {
        private double r;

        public Krug(double r)
        {
            this.r = r;
        }

        public double GetR()
        {
            return r;
        }

        public void SetR(double r)
        {
            this.r = r;
        }

        public double GetO()
        {
            return 2 * Math.PI * r;
        }

        public double GetP()
        {
            return Math.Pow(r, 2) * Math.PI;
        }
    }
}
