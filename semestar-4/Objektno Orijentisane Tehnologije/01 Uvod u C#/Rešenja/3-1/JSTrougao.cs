using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z31
{
    public class JSTrougao
    {
        private double a;

        public double A
        {
            get { return a; }
            set { a = value; }
        }

        public JSTrougao(double a)
        {
            A = a;
        }

        public double GetO()
        {
            return A * 3;
        }

        public double GetP()
        {
            double s = GetO() / 2;
            return Math.Sqrt(s * Math.Pow((s - A), 3));
        }

    }
}
