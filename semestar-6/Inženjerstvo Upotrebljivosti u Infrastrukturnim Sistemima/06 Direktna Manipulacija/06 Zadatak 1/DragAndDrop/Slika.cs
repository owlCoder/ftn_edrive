using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DragAndDrop
{
    public class Slika
    {
        public string Putanja { get; set; }
        public string ImeDatoteke { get; set; }

        public Slika()
        {

        }
    }

    public class SlikePoEkstenziji
    {
        public string Ekstenzija { get; set; }
        public BindingList<Slika> Slike  { get; set; }

        public SlikePoEkstenziji()
        {
            Slike = new BindingList<Slika>();
        }
    }
}
