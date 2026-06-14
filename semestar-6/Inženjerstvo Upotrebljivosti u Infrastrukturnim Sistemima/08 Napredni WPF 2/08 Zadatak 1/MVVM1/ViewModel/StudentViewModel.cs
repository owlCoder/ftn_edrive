using MVVM1.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MVVM1.ViewModel
{
    public class StudentViewModel : BindableBase
    {
        public ObservableCollection<Student> Students
        {
            get; set;
        }

        public MyICommand AddCommand { get; set; }
        public MyICommand DeleteCommand { get; set; }
        private Student selectedStudent;
        private string firstNameText;
        private string lastNameText;

        public StudentViewModel()
        {
            LoadStudents();

            AddCommand = new MyICommand(OnAdd);
            DeleteCommand = new MyICommand(OnDelete, CanDelete);
        }

        public void LoadStudents()
        {
            ObservableCollection<Student> students =
                new ObservableCollection<Student>();

            students.Add(new Student { FirstName = "Petar", LastName = "Petrovic" });
            students.Add(new Student { FirstName = "Marko", LastName = "Markovic" });
            students.Add(new Student { FirstName = "Jovan", LastName = "Jovanovic" });

            Students = students;
        }

        public string FirstNameText
        {
            get
            {
                return firstNameText;
            }

            set
            {
                if(firstNameText != value)
                {
                    firstNameText = value;
                    OnPropertyChanged("FirstNameText");
                }
            }
        }

        public string LastNameText
        {
            get
            {
                return lastNameText;
            }

            set
            {
                if (lastNameText != value)
                {
                    lastNameText = value;
                    OnPropertyChanged("LastNameText");
                }
            }
        }

        public Student SelectedStudent
        {
            get
            {
                return selectedStudent;
            }

            set
            {
                if(selectedStudent != value)
                {
                    selectedStudent = value;
                    DeleteCommand.RaiseCanExecuteChanged();
                }
            }
        }

        private void OnAdd()
        {
            Students.Add(new Student { FirstName = FirstNameText, LastName = LastNameText });
        }

        private void OnDelete()
        {
            Students.Remove(selectedStudent);
        }

        private bool CanDelete()
        {
            return selectedStudent != null;
        }
    }
}
