using ODP_NET_example_template.Model;
using ODP_NET_Test.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_example_template.DAO
{
    public interface INekretninaDao : ICRUDDao<Nekretnina, int>
    {
        List<Nekretnina> KvdVecaOd(float kvd);
        void Transakcija(int idn, int brnek);

        int SpecCount(string idv);
        double SpecSaldo(string idv);
        List<Nekretnina> SpecNekretnina(string idv);
    }
}
