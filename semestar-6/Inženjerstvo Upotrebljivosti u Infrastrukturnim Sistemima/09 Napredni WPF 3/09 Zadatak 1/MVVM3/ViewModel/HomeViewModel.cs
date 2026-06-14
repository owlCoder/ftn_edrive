using MVVM3.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MVVM3.ViewModel
{
    public class HomeViewModel : BindableBase
    {
        private string applicationTitle;
        private string applicationSubtitle;

        public HomeViewModel()
        {
            ApplicationTitle = "Notes App";
            ApplicationSubtitle = "PSI IUIS MVVM Example";
        }

        public string ApplicationTitle
        {
            get { return applicationTitle; }
            set
            {
                applicationTitle = value;
                OnPropertyChanged("ApplicationTitle");
            }
        }

        public string ApplicationSubtitle
        {
            get { return applicationSubtitle; }
            set
            {
                applicationSubtitle = value;
                OnPropertyChanged("ApplicationSubtitle");
            }
        }
    }
}
