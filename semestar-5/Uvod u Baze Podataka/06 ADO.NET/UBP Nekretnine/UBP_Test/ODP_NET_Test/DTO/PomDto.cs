using ODP_NET_example_template.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ODP_NET_example_template.DTO
{
    public class PomDto
    {
        public Vlasnik Vlasnik { get; set; } 
        public int BrojNek { get; set; }
        public double Saldo { get; set; }
        public List<Nekretnina> Nekretnine { get; set; }

        public PomDto() 
        {
            Vlasnik = null;
            BrojNek = 0;
            Saldo = 0;
            Nekretnine = new List<Nekretnina>();
        }

        public PomDto(Vlasnik vlasnik, int brojNek, double saldo, List<Nekretnina> nekretnine)
        {
            Vlasnik = vlasnik;
            BrojNek = brojNek;
            Saldo = saldo;
            Nekretnine = nekretnine;
        }
    }
}
