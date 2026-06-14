using Common.Interfejsi;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace Common.Implementacije
{
    [Serializable]
    public class DeviceCollection : IDeviceCollection
    {
        private List<Device.Device> listaUredjaja = new List<Device.Device>();


        public bool AddDevice(Device.Device marshalRef)
        {
            if (listaUredjaja.Count > 9) // npr max 9 mernih uredjaja
                return false;
            else
            {
                listaUredjaja.Add(marshalRef);
                return true;
            }
        }

        public List<Device.Device> GetDevices()
        {
            return listaUredjaja;
        }

        public bool AddDevice()
        {
            if (listaUredjaja.Count > 9) // npr max 9 mernih uredjaja
                return false;
            else
            {
                listaUredjaja.Add(new Device.Device());
                return true;
            }
        }
    }
}
