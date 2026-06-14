using ODP_NET_example_template.DAO;
using ODP_NET_example_template.DAO.DAOImpl;
using ODP_NET_example_template.DTO;
using ODP_NET_example_template.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_example_template.Service
{
    public class AerodromService
    {
        private static readonly IAerodrom aerodrom = new AerodromDaoImpl();

        public List<Ruta> LakIzvestaj(string naziva)
        {
            return aerodrom.LakIzvestaj(naziva);
        }

        public void Transakcija(string idp, string ida)
        {
            aerodrom.Transakcija(idp, ida);
        }

        public List<KompleksDTO> KompleksanIzvestaj()
        {
            return aerodrom.KompleksanIzvestaj();
        }
    }
}
