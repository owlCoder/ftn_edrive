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
    public class MainWindowViewModel : BindableBase
    {
        public MyICommand<string> NavCommand { get; private set; }
        public MyICommand<Window> CloseWindowCommand { get; private set; }
        public static ObservableCollection<Note> Notes { get; set; }
        public HomeViewModel homeViewModel;
        public AddNoteViewModel addNoteViewModel;
        public NotesViewModel notesViewModel;
        private BindableBase currentViewModel;
        private Visibility windowTitleVisibility;

        public MainWindowViewModel()
        {
            WindowTitleVisibility = Visibility.Hidden;

            NavCommand = new MyICommand<string>(OnNav);
            CloseWindowCommand = new MyICommand<Window>(CloseWindow);

            Notes = new ObservableCollection<Note>();

            addNoteViewModel = new AddNoteViewModel();
            homeViewModel = new HomeViewModel();
            notesViewModel = new NotesViewModel();
            CurrentViewModel = homeViewModel;

            Messenger.Default.Register<Note>(this, AddToList);
        }

        public BindableBase CurrentViewModel
        {
            get { return currentViewModel; }
            set
            {
                SetProperty(ref currentViewModel, value);
            }
        }

        public Visibility WindowTitleVisibility
        {
            get { return windowTitleVisibility; }
            set
            {
                windowTitleVisibility = value;
                OnPropertyChanged("WindowTitleVisibility");
            }
        }

        private void OnNav(string destination)
        {
            switch (destination)
            {
                case "home":
                    CurrentViewModel = homeViewModel;
                    WindowTitleVisibility = Visibility.Hidden;
                    break;
                case "list":
                    CurrentViewModel = notesViewModel;
                    WindowTitleVisibility = Visibility.Visible;
                    break;
                case "add":
                    CurrentViewModel = addNoteViewModel;
                    WindowTitleVisibility = Visibility.Visible;
                    break;
            }
        }

        private void AddToList(Note noteToAdd)
        {
            Notes.Insert(0, noteToAdd);
            OnNav("list");
        }

        private void CloseWindow(Window MainWindow)
        {
            MainWindow.Close();
        }
    }
}
