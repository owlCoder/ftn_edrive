using Common.Models;

namespace Common.API.Prototypes.PrototypeUpdate
{
    public interface IUpdatePrototype
    {
        bool EditPrototype(long imei, MobileDevice new_prototype);
    }
}
