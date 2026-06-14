using System;

namespace Zadatak_1
{
    public class Parallelogram : IQuadrilateral
    {
        public double Width { get; set; }
        public double Length { get; set; }
        public double Heigth { get; set; }

        public Parallelogram(double w = 1, double l = 2, double h = 3)
        {
            Width = w;
            Length = l;
            Heigth = h;
        }

        public double CalculateArea()
        {
            return Width * Heigth;
        }

        public double CalculatePerimeter()
        {
            return 2 * (Width + Length);
        }

        public void ShowInfo()
        {
            Console.WriteLine("-------------------- PARELELLOGRAM --------------------");
            Console.WriteLine("\ta = {0}, b = {1}\n\tPerimeter = {2}, Area = {3}\n",
                              Width, Length, CalculatePerimeter(), CalculateArea());
        }
    }
}
