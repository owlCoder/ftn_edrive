////////////////////////////////////////////////////////////
// Content Managment System Open-Source API v2023.03.23  ///
// Author: owlCoder (https://github.com/owlCoder)        ///
////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////
////////////////////////// MODELS //////////////////////////
////////////////////////////////////////////////////////////

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

        public MobileDevice(long iMEI, string model, string memory, string imagePath, string rTFPath, DateTime lastAccessed, string src = "https://google.com")
        {
            string guid = Guid.NewGuid().ToString();

            IMEI = iMEI;
            Model = model;
            Memory = memory;
            ImagePath = guid + ".jpg";
            RTFPath = guid + ".rtf";
            LastAccessed = lastAccessed;
            Delete = false;


            if (src != null && src.Length > 20)
            {
                ExtSrc = src.Substring(0, 20);
            }
            else
            {
                ExtSrc = src;
            }

            // copy image to program data folder
            File.Copy(imagePath, Paths.ImgPath + guid + ".jpg", true);

            // copy rtf to program data folder
            File.Copy(rTFPath, Paths.RtfPath + guid + ".rtf", true);

            ImagePathAssembly = Paths.ImgPath + guid + ".jpg";
            RtfPathAssembly = Paths.RtfPath + guid + ".rtf";
        }
    }

    public class User
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public bool IsAdmin { get; set; }
        public string Admin { get; set; }

        public User(string username = "user", string password = "user", bool isAdmin = false)
        {
            Username = username;
            Password = password;
            IsAdmin = isAdmin;

            if (IsAdmin)
            {
                Admin = "Ima editorska prava";
            }
            else
            {
                Admin = "Nema editorska prava";
            }
        }
    }
}


////////////////////////////////////////////////////////////
////////////////////// END OF MODELS ///////////////////////
////////////////////////////////////////////////////////////

// END OF API EXPOSED METHODS