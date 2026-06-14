using MVVM3.Helpers;
using MVVM3.Model;
using MVVMLight.Messaging;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace MVVM3.ViewModel
{
    public class NotesViewModel : BindableBase
    {
        public ObservableCollection<Note> Notes { get; set; }
        public MyICommand ShowNoteCommand { get; set; }
        private Note selectedNote = new Note();
        private Visibility showNoteDetails;

        public NotesViewModel()
        {
            Notes = new ObservableCollection<Note>();
            ShowNoteDetails = Visibility.Hidden;
            ShowNoteCommand = new MyICommand(ShowNote);
        }

        public NotesViewModel(ObservableCollection<Note> MainList)
        {
            Notes = new ObservableCollection<Note>();
            foreach (Note n in MainList)
            {
                Notes.Add(n);
            }
            if(Notes.Count > 0)
            {
                SelectedNote = Notes[0];
                ShowNoteDetails = Visibility.Visible;
            }
            else
            {
                ShowNoteDetails = Visibility.Hidden;
            }
            ShowNoteCommand = new MyICommand(ShowNote);
        }

        private void LoadList(ObservableCollection<Note> MainList)
        {
            Notes = null;
            Notes = new ObservableCollection<Note>();
            foreach (Note n in MainList)
            {
                Notes.Add(n);
            }
            OnPropertyChanged("Notes");
        }

        public void ShowNote()
        {
            if (SelectedNote != null)
            {
                ShowNoteDetails = Visibility.Visible;
            }
        }

        public Note SelectedNote
        {
            get { return selectedNote; }
            set
            {
                selectedNote = value;
                OnPropertyChanged("SelectedNote");
            }
        }

        public Visibility ShowNoteDetails
        {
            get { return showNoteDetails; }
            set
            {
                showNoteDetails = value;
                OnPropertyChanged("ShowNoteDetails");
            }
        }
    }
}
