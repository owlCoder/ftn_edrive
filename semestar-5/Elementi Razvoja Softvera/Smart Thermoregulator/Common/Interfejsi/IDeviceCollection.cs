using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace Common.Interfejsi
{
    public interface IDeviceCollection
    {
        bool AddDevice(Device.Device mr);
        List<Device.Device> GetDevices();
    }
}
