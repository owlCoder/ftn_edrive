using System;

namespace Common.Constants
{
    public class Paths
    {
        public static readonly string PathPrefix = AppDomain.CurrentDomain.BaseDirectory + "/data/";
        public static readonly string RtfPath = PathPrefix + "rtf/";
        public static readonly string ImgPath = PathPrefix + "img/";
        public static readonly string DbsPath = PathPrefix + "db/";

        public static readonly string UsersPath = DbsPath + "Cms.Users.Generic.dll";
        public static readonly string DevicesPath = DbsPath + "Cms.Devices.Collection.dll";
    }
}
