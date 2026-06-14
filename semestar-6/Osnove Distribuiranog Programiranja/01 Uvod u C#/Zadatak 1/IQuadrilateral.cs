namespace Zadatak_1
{
    public interface IQuadrilateral
    {
        double Width { get; set; }
        double Length { get; set; }
        double CalculatePerimeter();
        double CalculateArea();
        void ShowInfo();
    }
}
