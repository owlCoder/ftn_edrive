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
