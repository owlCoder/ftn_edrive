using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;

namespace Z5
{
    class XCDStorageDictionary
    {
        private Dictionary<Int32, CDDisk> arhiva;

        public XCDStorageDictionary()
        {
            arhiva = new Dictionary<Int32, CDDisk>();
        }

        public bool Add(CDDisk d)
        {
            if (arhiva.ContainsKey(d.Id))
                return false;

            arhiva.Add(d.Id, d);
            return true;
        }

        public bool Remove(int id)
        {
            return arhiva.Remove(id); // id je kljuc, ne treba nam for! Uporedi sa XCDStorage
        }

        public CDDisk Find(int id)
        {
            return arhiva[id]; // i je kljuc, ne treba nam for! Uporedi sa XCDStorage
        }

        public void Clear()
        {
            arhiva.Clear();
        }

        public override String ToString()
        {
            if (arhiva.Count == 0) return "U arhivi nema diskova!";

            String str = "Sadrzaj CD arhive je:\n";
            foreach (CDDisk d in arhiva.Values)
                str += d + "\n";
            return str;
        }

    }
}
