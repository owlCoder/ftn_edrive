using Common;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public class Sacuvaj
    {
        public static void SacuvajPodatke(BindingList<Brabus> podaci)
        {
            using (StreamWriter writer = new StreamWriter("podaci.json"))
            {
                string json = JsonConvert.SerializeObject(podaci);
                writer.Write(json);
                writer.Flush();
            }
        }

        public static BindingList<Brabus> UcitajPodatke()
        {
            if (File.Exists("podaci.json"))
            {
                string jsonFromFile = File.ReadAllText("podaci.json");
                return JsonConvert.DeserializeObject<BindingList<Brabus>>(jsonFromFile);
            }

            return new BindingList<Brabus>();
        }
    }
}
