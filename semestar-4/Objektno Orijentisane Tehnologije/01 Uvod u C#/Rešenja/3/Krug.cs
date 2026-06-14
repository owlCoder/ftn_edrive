using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z3
{
    public class Krug
    {
        private double r;

        public double R
        {
            get { return r; }
            set { r = value; }
        }

        public Krug(double r)
        {
            this.R = r;
        }

        public double GetO()
        {
            return 2 * Math.PI * R;
        }

        public double GetP()
        {
            return Math.Pow(R, 2) * Math.PI;
        }

    }
}
