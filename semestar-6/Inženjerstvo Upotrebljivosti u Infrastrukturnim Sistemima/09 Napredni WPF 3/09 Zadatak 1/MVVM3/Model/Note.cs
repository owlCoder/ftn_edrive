using MVVM3.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MVVM3.Model
{
    public class Note : ValidationBase
    {
        private string title;
        private string description;
        private string shortDescription;
        private string dateTimeString;

        public Note()
        {
            DateTimeString = String.Format("Date added: {0}", DateTime.Now.ToString("dd/MM/yyyy HH:mm"));
        }

        public string Title
        {
            get { return title; }
            set
            {
                if (title != value)
                {
                    title = value;
                    OnPropertyChanged("Title");
                }
            }
        }

        public string Description
        {
            get { return description; }
            set
            {
                if (description != value)
                {
                    description = value;
                    OnPropertyChanged("Description");
                }
            }
        }

        public string ShortDescription
        {
            get
            {
                if (description.Length > 50)
                {
                    return String.Format("{0}...", description.Substring(0, 50));
                }
                else
                {
                    return description;
                }
            }
            set
            {
                if (shortDescription != value)
                {
                    shortDescription = value;
                    OnPropertyChanged("ShortDescription");
                }
            }
        }

        public string DateTimeString
        {
            get { return dateTimeString; }
            set
            {
                if (dateTimeString != value)
                {
                    dateTimeString = value;
                    OnPropertyChanged("DateTimeString");
                }
            }
        }

        protected override void ValidateSelf()
        {
            if (string.IsNullOrWhiteSpace(this.title))
            {
                this.ValidationErrors["Title"] = "Title is required.";
            }
            if (string.IsNullOrWhiteSpace(this.description))
            {
                this.ValidationErrors["Description"] = "Description cannot be empty.";
            }
        }
    }
}
