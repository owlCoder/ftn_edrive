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
