using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dummy
{
    public class Vehicle : IVehicle
    {
        private IRoad road;

        public Vehicle(IRoad road)
        {
            this.road = road;
        }
        public double Drive(double min, double max)
        {
            return GetRandomNumberInRange(min, max);
        }

        private double GetRandomNumberInRange(double minNumber, double maxNumber)
        {
            return new Random().NextDouble() * (maxNumber - minNumber) + minNumber;
        }
    }
}
