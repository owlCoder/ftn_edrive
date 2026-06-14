using System;

namespace Zadatak_1
{
    class Program
    {
        static void Main(string[] args)
        {

            Rectangle rectangle = new Rectangle();
            Rectangle rectangle1 = new Rectangle(5.0, 2.0);

            rectangle.ShowInfo();
            rectangle1.ShowInfo();

            Console.WriteLine("Instance number: {0}", Rectangle.Instances());

            Rectangle rectangle2 = new Rectangle();
            rectangle2.ShowInfo();

            Console.WriteLine("Instance number: {0}\n", Rectangle.Instances());

            Parallelogram parallelogram = new Parallelogram(1, 2, 3);
            parallelogram.ShowInfo();

            Console.ReadKey(); // keep console on
        }
    }
}
