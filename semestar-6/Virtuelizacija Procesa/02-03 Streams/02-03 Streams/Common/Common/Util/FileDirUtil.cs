using System.IO;

namespace Common.Util
{
    public class FileDirUtil
    {
        /// <summary>
        /// Metod treba da kreira direktorijum sa prosledjenom lokacijom, ukoliko vec ne postoji.
        /// Ako se direktorijum ne moze kreirati, potrebno je da metod vrati vrednost false.
        /// </summary>
        /// <param name="path"></param>
        public static bool CreateDirIfNotExists(string path)
        {
            // IMPLEMENTIRATI
            try
            {
                DirectoryInfo di = new DirectoryInfo(path);
                if (!di.Exists)
                {
                    di.Create();
                }
            }
            catch (System.Exception)
            {
                return false;
            }
            return true;
        }

        /// <summary>
        /// Metod treba da proveri da li je prosledjena lokacija validna za kreiranje direktorijuma.
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        public static bool IsPathValid(string path)
        {
            // IMPLEMENTIRATI
            return Path.IsPathRooted(path);
        }

        public static void CheckCreatePath(string path)
        {
            if (!IsPathValid(path))
            {
                throw new CustomException($"Invalid path: {path}");
            }
            CreateDirIfNotExists(path);
        }

        /// <summary>
        /// Metod treba da vrati putanje svih datoteka koje se nalaze na prosledjenoj lokaciji
        /// Direktorijumi ne treba da budu ukljuceni
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        public static string[] GetAllFiles(string path)
        {
            // IMPLEMENTIRATI
            return Directory.GetFiles(path, "*.*", SearchOption.TopDirectoryOnly);
        }
    }
}
