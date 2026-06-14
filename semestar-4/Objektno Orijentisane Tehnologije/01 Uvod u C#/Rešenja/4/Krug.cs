using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z1
{
    public class Krug : GeometrijskaFigura
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

        public override double GetO()
        {
            return 2 * Math.PI * R;
        }

        public override double GetP()
        {
            return Math.Pow(R, 2) * Math.PI;
        }

        public override String ToString()
        {
            return "Krug r = " + R;
        }


    }
}
