namespace Common.Exception
{
    public class IncorrectDataException : System.Exception
    {
        public IncorrectDataException(string message) : base(message)
        {
        }

        public IncorrectDataException() : base("Invalid data found!")
        {
        }

    }
}
