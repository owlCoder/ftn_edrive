////////////////////////////////////////////////////////////
// Content Managment System Open-Source API v2023.03.23  ///
// Author: owlCoder (https://github.com/owlCoder)        ///
////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////
///////////////////// INMEMORYDATABASE /////////////////////
////////////////////////////////////////////////////////////

using Common.Models;
using System.ComponentModel;

namespace Common.InMemoryDatabase
{
    public class Database
    {
        #region IN MEMORY DATABASE TABLES
        public static BindingList<User> Users = new BindingList<User>();

        public static User AuthenticatedUser = null;

        public static BindingList<MobileDevice> Devices = new BindingList<MobileDevice>();
        #endregion

        #region CLASS BASIC CONSTRUCTORS
        public Database()
        {
            if (Users == null)
            {
                Users = new BindingList<User>();
            }

            if (Devices == null)
            {
                Devices = new BindingList<MobileDevice>();
            }
        }
        #endregion
    }
}


////////////////////////////////////////////////////////////
///////////////// END OF INMEMORYDATABASE //////////////////
////////////////////////////////////////////////////////////

// END OF API EXPOSED METHODS