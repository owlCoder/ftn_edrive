using System.Runtime.Serialization;

namespace Common
{
    [DataContract]
    public class CustomException: System.Exception
    {
        string message;

        public CustomException(string message)
        {
            this.Message = message;
        }

        [DataMember]
        public string Message { get => message; set => message = value; }
    }
}
