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
                    new_prototype.Delete = tmp.Delete;
                    Database.Devices.Insert(i, new_prototype);
                    PrototypeService.PrototypeService.SaveToDiskJson();
                    return true;
                }

                i++;
            }

            return false;
        }
    }
}
