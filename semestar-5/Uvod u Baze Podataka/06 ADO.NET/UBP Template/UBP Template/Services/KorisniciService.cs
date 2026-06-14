using System.Collections.Generic;
using UBP_Template.DAO.Interfaces;

namespace UBP_Template.Services
{
    public class KorisniciService
    {
        private static readonly IKorisnici korisnici = new DAO.Implementations.Korisnici();

        public IEnumerable<Models.Korisnik> GetAllKorisnici()
        {
            return korisnici.FindAll();
        }

        public Models.Korisnik GetExactKorisnici(int id)
        {
            return korisnici.FindById(id);
        }
    }
}
