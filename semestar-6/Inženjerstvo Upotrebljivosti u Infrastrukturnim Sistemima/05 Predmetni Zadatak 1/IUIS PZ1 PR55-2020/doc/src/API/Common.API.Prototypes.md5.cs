////////////////////////////////////////////////////////////
// Content Managment System Open-Source API v2023.03.23  ///
// Author: owlCoder (https://github.com/owlCoder)        ///
////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////
/////////////////////// PROTOTYPES /////////////////////////
////////////////////////////////////////////////////////////

// Common/API/Prototypes/PrototypeCreation/IAddPrototype.cs
using Common.Models;

namespace Common.API.Prototypes.PrototypeCreation
{
    public interface IAddPrototype
    {
        bool AddNewPrototype(MobileDevice device);
    }
}

// Common/API/Prototypes/PrototypeCreation/AddPrototype.cs
using Common.InMemoryDatabase;
using Common.Models;

namespace Common.API.Prototypes.PrototypeCreation
{
    public class AddPrototype : IAddPrototype
    {
        public bool AddNewPrototype(MobileDevice device)
        {
            foreach (MobileDevice tmp in Database.Devices)
            {
                // imei is unique for every mobile device
                if (tmp.IMEI == device.IMEI)
                {
                    return false;
                }
            }

            Database.Devices.Add(device);
            PrototypeService.PrototypeService.SaveToDiskJson();

            return true;
        }
    }
}

// Common/API/Prototypes/PrototypeDeletion/IDeletePrototype.cs
using Common.InMemoryDatabase;
using Common.Models;

namespace Common.API.Prototypes.PrototypeCreation
{
    public class AddPrototype : IAddPrototype
    {
        public bool AddNewPrototype(MobileDevice device)
        {
            foreach (MobileDevice tmp in Database.Devices)
            {
                // imei is unique for every mobile device
                if (tmp.IMEI == device.IMEI)
                {
                    return false;
                }
            }

            Database.Devices.Add(device);
            PrototypeService.PrototypeService.SaveToDiskJson();

            return true;
        }
    }
}

// Common/API/Prototypes/PrototypeDeletion/DeletePrototype.cs
using Common.InMemoryDatabase;
using Common.Models;
using System.IO;

namespace Common.API.Prototypes.PrototypeDeletion
{
    public class DeletePrototype : IDeletePrototype
    {
        public bool RemovePrototype(long imei)
        {
            foreach (MobileDevice tmp in Database.Devices)
            {
                if (tmp.IMEI == imei)
                {
                    Database.Devices.Remove(tmp);

                    // delete rtf from disk
                    File.Delete(tmp.RTFPath);

                    PrototypeService.PrototypeService.SaveToDiskJson();
                    return true;
                }
            }

            return false;
        }
    }
}

// Common/API/Prototypes/PrototypeUpdate/IUpdatePrototype.cs
using Common.Models;

namespace Common.API.Prototypes.PrototypeUpdate
{
    public interface IUpdatePrototype
    {
        bool EditPrototype(long imei, MobileDevice new_prototype);
    }
}

// Common/API/Prototypes/PrototypeUpdate/UpdatePrototype.cs
using Common.InMemoryDatabase;
using Common.Models;

namespace Common.API.Prototypes.PrototypeUpdate
{
    public class UpdatePrototype : IUpdatePrototype
    {
        public bool EditPrototype(long imei, MobileDevice new_prototype)
        {
            int i = 0;
            foreach (MobileDevice tmp in Database.Devices)
            {
                if (tmp.IMEI == imei)
                {
                    Database.Devices.RemoveAt(i);
                    Database.Devices.Insert(i, new_prototype);
                    return true;
                }

                i++;
            }

            PrototypeService.PrototypeService.SaveToDiskJson();

            return false;
        }
    }
}

// Common/API/Prototypes/PrototypeService/IPrototypeService.cs
namespace Common.API.Prototypes.PrototypeService
{
    public interface IPrototypeService
    {
        // EMPTY
    }
}

// Common/API/Prototypes/PrototypeService/PrototypeService.cs
using Common.API.Prototypes.PrototypeCreation;
using Common.API.Prototypes.PrototypeDeletion;
using Common.API.Prototypes.PrototypeUpdate;
using Common.Constants;
using Common.InMemoryDatabase;
using Common.Models;
using Newtonsoft.Json;
using System.ComponentModel;
using System.IO;

namespace Common.API.Prototypes.PrototypeService
{
    public class PrototypeService
    {
        public static readonly IAddPrototype CreatePrototype = new AddPrototype();
        public static readonly IDeletePrototype RemovePrototype = new DeletePrototype();
        public static readonly IUpdatePrototype EditPrototype = new UpdatePrototype();

        public static void SaveToDiskJson()
        {
            using (StreamWriter writer = new StreamWriter(Paths.DevicesPath))
            {
                string json = JsonConvert.SerializeObject(Database.Devices);
                writer.Write(json);
                writer.Flush();
            }
        }

        public static void LoadFromDiskJson()
        {
            if (File.Exists(Paths.DevicesPath))
            {
                string jsonFromFile = File.ReadAllText(Paths.DevicesPath);
                Database.Devices = JsonConvert.DeserializeObject<BindingList<MobileDevice>>(jsonFromFile);
            }
        }
    }
}

////////////////////////////////////////////////////////////
///////////////////// END OF PROTOTYPES ////////////////////
////////////////////////////////////////////////////////////

// END OF API EXPOSED METHODS