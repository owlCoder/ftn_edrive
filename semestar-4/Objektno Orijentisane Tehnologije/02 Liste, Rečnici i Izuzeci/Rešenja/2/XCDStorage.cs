using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;

namespace Z5
{
    class XCDStorage
    {
        private List<CDDisk> arhiva;

        public XCDStorage()
        {
            arhiva = new List<CDDisk>();
        }

        public bool Add(CDDisk d)
        {
            for (int i = 0; i < arhiva.Count; i++)
                if ((arhiva[i]).Id == d.Id)
                    return false;

            arhiva.Add(d);
            return true;
        }

        public bool Remove(int id)
        {
            for (int i = 0; i < arhiva.Count; i++)
                if ((arhiva[i]).Id == id)
                {
                    arhiva.RemoveAt(i);
                    return true;
                }

            return false;
        }

        public CDDisk Find(int id)
        {
            for (int i = 0; i < arhiva.Count; i++)
                if ((arhiva[i]).Id == id)
                    return arhiva[i]; 

            return null;
        }

        public void Clear()
        {
            arhiva.Clear();
        }

        public override String ToString()
        {
            if (arhiva.Count == 0) return "U arhivi nema diskova!";

            String str = "Sadrzaj CD arhive je:\n";
            foreach (CDDisk d in arhiva)
                str  += d + "\n";
            return str;
        }

    }
}
