using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Z31
{
    public class TeloB : TeloA
    {
        public TeloB(double a) : base(a, a, a, a, a) { }

        public override string ToString()
        {
            return "TeloB: P = " + GetP() + ", V = " + GetV();
        }

    }
}
