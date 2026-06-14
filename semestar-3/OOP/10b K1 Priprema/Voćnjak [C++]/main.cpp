#include "Vocnjak.hpp"

int Stablo::rbrSadnice = 0;
int StabloJabuke::brojSadnice = 0;
int StabloSljive::brojSadnice = 0;

double prosecniPrinos(const Vocnjak &v) {
    double prosek = 0.0;
    int brojac = 0;

    List<Stablo *> voce = v.getSadrzajVocnjaka();
    Stablo *tmp;

    if(voce.empty()) {
        return 0.0;
    }
    else {
        for(int i = 1; i <= voce.size(); i++) {
            voce.read(i, tmp);
            prosek += tmp -> getPrinos();
            brojac++;
        }
        prosek /= brojac;
        return prosek;
    }
}

int main(void)
{
    // STABLO JABUKE
    StabloJabuke sj1, sj2("Plantea", "Apples", "Nature", 123, "JABUKA", 2, "01.01.2023.", CRVENA), sj3(sj1);

    cout << sj1 << sj2 << sj3;

    sj1.getBojaJabuke();   sj1.getBrojSadnice();  sj1.getCarstvo();
    sj1.getDatumSadnje();  sj1.getLotBroj();      sj1.getPorodica();
    sj1.getRbrSadnice();   sj1.getRod();          sj1.getStarost();

    sj1.setBojaJabuke(ZUTA);            sj1.setStarost(3);      sj1.setCarstvo("Biljaka");
    sj1.setDatumSadnje("23.12.2021.");  sj1.setLotBroj(112);    sj1.setPorodica("Jabuke");
    sj1.setRod("JAB");                  sj1.setTipStabla("JABUKA");

    cout << endl << "SJ1 = SJ2" << endl;
    sj1 = sj2;
    cout << sj1;

    // STABLO SLJIVE
    StabloSljive ss1, ss2("Plantea", "Sljive", "Nat", 143, "SLJIVA", 44, "01.01.2022.", true), ss3(ss1);

    cout << ss1 << ss2 << ss3;

    ss1.getZdravo();       ss1.getBrojSadnice();  ss1.getCarstvo();
    ss1.getDatumSadnje();  ss1.getLotBroj();      ss1.getPorodica();
    ss1.getRbrSadnice();   ss1.getRod();          ss1.getStarost();

    ss1.setZdravo(false);               ss1.setStarost(3);      ss1.setCarstvo("Biljaka");
    ss1.setDatumSadnje("23.12.2021.");  ss1.setLotBroj(112);    ss1.setPorodica("Jabuke");
    ss1.setRod("SLJIVA");               ss1.setTipStabla("SLJIVA");

    cout << ss1;

    // VOCNJAK
    Vocnjak v1;

    cout << "DODAJ SJ1: " << (v1.dodajStablo(sj1) == true ? "DODATO" : "NIJE DODATO") << endl;
    cout << "DODAJ SJ2: " << (v1.dodajStablo(sj2) == true ? "DODATO" : "NIJE DODATO") << endl;
    cout << "DODAJ SJ2: " << (v1.dodajStablo(sj2) == true ? "DODATO" : "NIJE DODATO") << endl;
    cout << "DODAJ SS1: " << (v1.dodajStablo(ss1) == true ? "DODATO" : "NIJE DODATO") << endl;
    cout << "DODAJ SS1: " << (v1.dodajStablo(ss1) == true ? "DODATO" : "NIJE DODATO") << endl;
    cout << "DODAJ SS2: " << (v1.dodajStablo(ss2) == true ? "DODATO" : "NIJE DODATO") << endl;
    cout << endl << "PROSECNI PRINOS: " << prosecniPrinos(v1) << endl;

    cout << v1;
    v1.sortiraj("RASTUCE");
    cout << endl << "NAKON SORTIRANJA" << endl << v1;

    cout << "TRAZI SJ1 (112 LB): " << endl;
    Stablo *trazi = v1.pronadji(112);
    if(trazi != NULL)
        cout << *trazi;
    else
        cout << "NIJE PRONADJENO!" << endl;

    cout << "BROJ STABALA SLJIVA U VOCNJAKU JE: " << v1.prebroj("SLJIVA") << endl;
    cout << "BROJ STABALA JABUKA U VOCNJAKU JE: " << v1.prebroj("JABUKA") << endl;

    return 0;
}
