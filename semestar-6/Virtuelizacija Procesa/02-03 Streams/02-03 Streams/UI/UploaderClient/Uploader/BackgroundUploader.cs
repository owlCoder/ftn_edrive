using System.Threading;
using UploaderClient.FileSending;

namespace UploaderClient.Uploader
{
    public class BackgroundUploader: IUploader
    {
        private readonly IFileSender fileSender;
        public BackgroundUploader(IFileSender fileSender)
        {
            this.fileSender = fileSender;
        }

        private void Do()
        {

            while (true)
            {
                fileSender.SendFiles();
                Thread.Sleep(3000);
            }
        }

        public void Start()
        {
            new Thread(() => Do()).Start();
        }
    }
}
