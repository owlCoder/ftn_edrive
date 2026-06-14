using MVVM3.Helpers;
using MVVM3.Model;
using MVVMLight.Messaging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MVVM3.ViewModel
{
    public class AddNoteViewModel : BindableBase
    {
        public MyICommand AddNoteCommand { get; set; }
        private Note currentNote = new Note();

        public AddNoteViewModel() 
        {
            AddNoteCommand = new MyICommand(OnAdd);
        }

        public Note CurrentNote
        {
            get { return currentNote; }
            set
            {
                currentNote = value;
                OnPropertyChanged("CurrentNote");
            }
        }

        public void OnAdd()
        {
            CurrentNote.Validate();
            if (CurrentNote.IsValid)
            {
                Note n = new Note()
                {
                    Title = CurrentNote.Title,
                    Description = CurrentNote.Description
                };

                Messenger.Default.Send<Note>(n);
                CurrentNote.Title = string.Empty;
                CurrentNote.Description = string.Empty;
            }
        }
    }
}
