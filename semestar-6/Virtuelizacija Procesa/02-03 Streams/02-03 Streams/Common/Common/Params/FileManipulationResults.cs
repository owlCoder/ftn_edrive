using Common.Enum;
using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization;

namespace Common.Params
{
    [DataContract]
    public class FileManipulationResults : IDisposable
    {
        public FileManipulationResults()
        {
            this.ResultType = ResultTypes.Success;
            MSs = new Dictionary<string, System.IO.MemoryStream>();
        }

        /// <summary>
        /// IMPLEMENTIRATI oslobadjanje memorije
        /// </summary>
        [DataMember]
        public Dictionary<string, MemoryStream> MSs { get; set; }

        [DataMember]
        public string ResultMessage { get; set; }

        [DataMember]
        public ResultTypes ResultType { get; set; }

        public void Dispose()
        {
            try
            {
                if (MSs == null)
                    return;
                foreach (KeyValuePair<string, MemoryStream> kvp in MSs)
                {
                    if (kvp.Value != null)
                    {
                        kvp.Value.Dispose();
                        kvp.Value.Close();
                    }
                }
                MSs.Clear();
            }
            catch (System.Exception)
            {
                Console.WriteLine("Unsuccesful disposing!");
            }
        }
    }
}
