using System;

namespace Zadatak_1
{
    public class Rectangle : IQuadrilateral
    {
        public double Width { get; set; }
        public double Length { get; set; }

        private static int instances = 0;
        public Rectangle(double w = 1.0, double l = 2.0)
        {
            Width = w;
            Length = l;

            instances += 1;
        }
        ~Rectangle()
        {
            instances -= 1;
        }

        public double CalculateArea()
        {
            return Width * Length;
        }

        public double CalculatePerimeter()
        {
            return 2 * (Width + Length);
        }

        public void ShowInfo()
        {
            Console.WriteLine("-------------------- RECTANGLE --------------------");
            Console.WriteLine("\ta = {0}, b = {1}\n\tPerimeter = {2}, Area = {3}\n",
                              Width, Length, CalculatePerimeter(), CalculateArea());
        }

        public static int Instances()
        {
            return instances;
        }
    }
}
