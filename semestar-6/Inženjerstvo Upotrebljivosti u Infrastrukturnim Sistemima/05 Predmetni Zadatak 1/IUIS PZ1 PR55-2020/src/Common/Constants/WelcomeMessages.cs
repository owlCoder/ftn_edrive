using System;

namespace Common.Constants
{
    public class WelcomeMessages
    {
        private static readonly string[] message = { "Hello, ", "Hi, ", "What's up, ", "Greetings, ", "Sup, ", "Hey, " };

        public static string Message()
        {
            return message[new Random().Next(0, 5)];
        }
    }
}
