using Biblioteka.Knjige;
using System.Collections.ObjectModel;
using System.Windows;

namespace Biblioteka
{
    public partial class App : Application
    {
        #region AUTO INKREMENTI ZA ID
        private static int idCounter = 1;			// Za biblioteke
        private static int idKorisnikaCnt = 1;		// Za korisnika
        private static int idKnjigeCnt = 1;         // Za knjigu
        #endregion

        #region PRIVREMENE REFERENCE NA POJEDINE (SELEKTOVANE) OBJEKTE
        static Biblioteke.Biblioteka selektovanaBiblioteka = null;
        static Knjige.Knjiga selektovanaKnjiga = null;
        static Korisnici.Korisnik selektovaniKorisnik = null;
        #endregion

        #region KOLEKCIJE ZA SVE BIBLIOTEKE, KNJIGE I KORISNIKE
        static ObservableCollection<Biblioteke.Biblioteka> biblioteke = new ObservableCollection<Biblioteke.Biblioteka>();
        static ObservableCollection<Knjige.Knjiga> sveKnjige = new ObservableCollection<Knjige.Knjiga>();
        static ObservableCollection<Korisnici.Korisnik> sviKorisnici = new ObservableCollection<Korisnici.Korisnik>();
        private static ObservableCollection<Knjiga> referencaNaKnjigePoBiblioteci = null;
        #endregion

        #region PROPERTY KLASE APP (KOLEKCIJE, ID COUNTERS, ...)
        internal static ObservableCollection<Knjige.Knjiga> ReferencaNaKnjigePoBiblioteci { get => referencaNaKnjigePoBiblioteci; set => referencaNaKnjigePoBiblioteci = value; }
        internal static ObservableCollection<Biblioteke.Biblioteka> Biblioteke { get => biblioteke; set => biblioteke = value; }
        internal static ObservableCollection<Knjige.Knjiga> SveKnjige { get => sveKnjige; set => sveKnjige = value; }
        internal static ObservableCollection<Korisnici.Korisnik> SviKorisnici { get => sviKorisnici; set => sviKorisnici = value; }
        internal static Biblioteke.Biblioteka SelektovanaBiblioteka { get => selektovanaBiblioteka; set => selektovanaBiblioteka = value; }
        internal static Knjige.Knjiga SelektovanaKnjiga { get => selektovanaKnjiga; set => selektovanaKnjiga = value; }
        internal static Korisnici.Korisnik SelektovaniKorisnik { get => selektovaniKorisnik; set => selektovaniKorisnik = value; }
        public static int IdCounter { get => idCounter; set => idCounter = value; }
        public static int IdKorisnikaCnt { get => idKorisnikaCnt; set => idKorisnikaCnt = value; }
        public static int IdKnjigeCnt { get => idKnjigeCnt; set => idKnjigeCnt = value; }
        #endregion
    }
}
