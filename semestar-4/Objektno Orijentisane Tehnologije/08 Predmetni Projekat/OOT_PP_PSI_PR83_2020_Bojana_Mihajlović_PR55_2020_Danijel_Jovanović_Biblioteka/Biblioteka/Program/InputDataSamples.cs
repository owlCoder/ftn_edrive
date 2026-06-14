using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Biblioteka.Program
{
    public class InputDataSamples
    {
        #region STATIČKA POLJA KAO REPREZENT ULAZ
        Random nasumican = new Random();
        static string[] naziviKnjiga = { "Ana Karenjina", "Crno i Zlatno", "Belo Platno", "Mlada Palačanka", "Šumadinac", "Kako ne upisati FTN", "Mala Noćna Muzika", "Lepo je ponovo biti mlad", "Nije sve kao pre", "Kad porastem biću...", "Karate Kid", "Mid & Jang", "Nije Loše", "Crveni Zid", "Mala Plava", "Kako je lepo biti...", "Sve još miriše na...", "Mali Kuvar", "Nikada ne odustaj!", "Kolekcija Dobra", "Plafen", "Put do vrha", "Sijalica" };
        static string[] autoriKnjiga = { "Aleksa Šantić", "Anton Čehov", "Bojana Despotović", "Danilo Kiš", "En Vann", "De Gusto", "El De Ak", "Danijel J.", "Bojana M.", "Bojana J.", "Even Star", "Jona Jones", "Majkl Tvik", "Repid Ol", "Ol De Gust", "Mal de Pal", "Noo Van De", "Armm Hun", "Hjao Bam",
        "Aleksa Šantić", "Anton Čehov", "Bojana Despotović", "Danilo Kiš", "En Vann", "De Gusto", "El De Ak", "Danijel J.", "Bojana M.", "Bojana J.", "Even Star", "Jona Jones", "Majkl Tvik", "Repid Ol", "Ol De Gust", "Mal de Pal", "Noo Van De", "Armm Hun", "Hjao Bam"};
        static string[] naziviBiblioteka = { "Narodna Biblioteka", "SKC NS", "SKY BOOK", "BG BOOK & COOL", "BIBL-NS", "Gradska Biblioteka", "De Gusto", "El De Ak", "Even Star", "Jona Jones", "Majkl Tvik", "Repid Ol", "Ol De Gust", "Mal de Pal", "Noo Van De" };
        static string[] naziviUlica = { "Alekse Santica ", "Puskinova ", "Dositejeva ", "Vere Pavlovic ", "Strazilovksa ", "Okolna " };
        static string[] imena = { "Bojana", "Aleksandar", "Danijel", "Danilo", "Anton", "Mihael", "Nevena" };
        static string[] prezimena = { "Antonić", "Merlić", "Kokić", "Milić", "Filić", "Kovačević" };
        static long[] jmbg = { 10023000000000, 1004300000000, 1011000000000, 1012000000000, 3400000000000, 30023000000000, 2004300000000, 1111000000000, 1012000000000, 0100000000000 };
        #endregion

        #region PROPERTY KLASE InputDataSamples
        public string[] NaziviKnjiga { get => naziviKnjiga; set => naziviKnjiga = value; }
        public string[] AutoriKnjiga { get => autoriKnjiga; set => autoriKnjiga = value; }
        public string[] NaziviBiblioteka { get => naziviBiblioteka; set => naziviBiblioteka = value; }
        public string[] NaziviUlica { get => naziviUlica; set => naziviUlica = value; }
        public string[] Imena { get => imena; set => imena = value; }
        public string[] Prezimena { get => prezimena; set => prezimena = value; }
        public long[] Jmbg { get => jmbg; set => jmbg = value; }
        public Random Nasumican { get => nasumican; set => nasumican = value; }
        #endregion
    }
}
