using Common.Constants;
using Newtonsoft.Json;
using System;
using System.IO;

namespace Common.Models
{
    public class MobileDevice
    {
        public long IMEI { get; set; }
        public string Model { get; set; }
        public string Memory { get; set; }
        public string ImagePath { get; set; }
        public string RTFPath { get; set; }
        public string ExternalSource { get; set; }
        public string ExtSrc { get; set; }
        public DateTime LastAccessed { get; set; }
        public bool Delete { get; set; }
        public string ImagePathAssembly { get; set; }
        public string RtfPathAssembly { get; set; }

        [JsonConstructor]
        public MobileDevice(long iMEI, string model, string memory, string imagePath,
                            string rTFPath, string externalSource, string extSrc, DateTime lastAccessed, bool delete)
        {
            IMEI = iMEI;
            Model = model;
            Memory = memory;
            ImagePath = imagePath;
            RTFPath = rTFPath;
            LastAccessed = lastAccessed;
            Delete = delete;
            ExternalSource = externalSource;
            ExtSrc = extSrc;

            ImagePathAssembly = Paths.ImgPath + imagePath;
            RtfPathAssembly = Paths.RtfPath + rTFPath;
        }

        public MobileDevice(long iMEI, string model, string memory, string imagePath,
                            string rTFPath, string externalSource, DateTime lastAccessed, bool dodaj)
        {
            string guid = Guid.NewGuid().ToString();

            IMEI = iMEI;
            Model = model;
            Memory = memory;
            ImagePath = guid + ".jpg";
            RTFPath = guid + ".rtf";
            LastAccessed = lastAccessed;
            ExternalSource = externalSource;
            Delete = false;


            if (externalSource != null && externalSource.Length > 20)
            {
                ExtSrc = externalSource.Substring(0, 20);
            }
            else
            {
                ExtSrc = externalSource;
            }

            // copy image to program data folder
            File.Copy(imagePath, Paths.ImgPath + guid + ".jpg", true);

            // copy rtf to program data folder
            if(!dodaj) 
                File.Copy(rTFPath, Paths.RtfPath + guid + ".rtf", true);

            ImagePathAssembly = Paths.ImgPath + guid + ".jpg";
            RtfPathAssembly = Paths.RtfPath + guid + ".rtf";
        }
    }
}
