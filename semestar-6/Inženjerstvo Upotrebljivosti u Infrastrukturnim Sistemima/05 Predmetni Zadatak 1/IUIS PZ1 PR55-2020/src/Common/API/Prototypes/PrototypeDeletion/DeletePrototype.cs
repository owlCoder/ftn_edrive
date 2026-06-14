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
                    File.Delete(tmp.RtfPathAssembly);

                    PrototypeService.PrototypeService.SaveToDiskJson();
                    return true;
                }
            }

            return false;
        }
    }
}
