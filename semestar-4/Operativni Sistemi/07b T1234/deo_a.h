#ifndef _1234_DEO_A_H
#define _1234_DEO_A_H

#include <random>
#include <thread>
#include <vector>

using namespace std;

typedef vector<float>::const_iterator ci;
typedef vector<float>::const_reverse_iterator cri;

/**
 * Provera da li je redosled elemenata u segmentu prvog vektora brojeva obrnut redosled segmenta drugog vektora brojeva.
 *
 * @param a_pocetak pocetak segmenta prvog vektora brojeva
 * @param a_kraj kraj segmenta prvog vektora brojeva
 * @param b_pocetak pocetak segmenta drugog vektora brojeva
 * @return da li je drugi vektor brojeva obrnutog redosleda u odnosu na prvi
 */
void jesu_li_isti_elementi(ci a_pocetak, ci a_kraj, cri b_pocetak, bool &rez) {
    while(a_pocetak != a_kraj)
    {
        if(*a_pocetak != *b_pocetak)
        {
            rez = false;
            return;
        }
        a_pocetak++;
        b_pocetak++;
    }

    rez = true;
}

/**
 * Paralelna/konkurentna provera da li je redosled brojeva u drugom vektoru brojeva obrnut u odnosu na prvi.
 * Broj niti zavisi od slucaja jer se za svaku nit nasumicno odredjuje velicina segmenta vektora za koji se vrsi provera.
 * Velicina segmenta koju obradjuje jedna nit moze biti bilo sta izmedju jednog i pet elemenata
 *
 * @param a prvi vektor brojeva
 * @param b drugi vektor brojeva
 * @return da li je drugi vektor brojeva obrnutog redosleda u odnosu na prvi
 */
bool proveri_obrnutost(vector<float> a, vector<float> b)
{
    srand(time(NULL));
    int velicinaPodele[a.size()];                    /// u najgorem slucaju imacemo niti onoliko koliko imamo elemenata u nizu
    int brojPodela = 0;
    int zbirPodelaElemenata = 0;
    int velicina = (int) a.size();
    bool rezultati[velicina + 1];                    /// + 1 u slucaju da podela nije ravnomerna

                                                     /// odredjuje se koliko cemo podela imati, ako niz ima 10 elemenata, jedna od podela je
                                                     /// 3 + 3 + 1 + 3, gde nulta, prva i treca nit obradjuju po 3 elementa vektora, dok druga nit obradjuje jedan element
                                                     /// u najgorem slucaju podela moze biti da broj niti bude jednak broju elemenata vektora
    while(zbirPodelaElemenata < velicina)
    {
        velicinaPodele[brojPodela] = rand() % 5 + 1; /// nasumicna podela segmenta u opsegu od 1 do 5
        zbirPodelaElemenata += velicinaPodele[brojPodela];
        brojPodela++;
    }

    thread *niti = NULL;

    if(zbirPodelaElemenata < velicina)               /// u zavisnoti da li je podela niza ravnomerna ili ne
        niti = new thread[brojPodela + 1];           /// dinamicki cemo alocirati memoriji za niti
    else
        niti = new thread[brojPodela];

    ci  pocetakNizaA = a.cbegin();                   /// konstanti iterator koji pocinje od pocetka niza a
    ci  krajNizaA    = a.cbegin();                   /// na pocetku, pre for petlje, pocetak i kraj su nam isti, posle ih pomeramo po broju podele
    cri krajNizaB    = b.crbegin();                  /// pocetak niza b je nama njegov trenutni kraj - gledamo da li je b obrnut vektor a
    /// cri krajNizaB    = b.crend();                /// i na ovaj nacin program ce isto raditi!
    for(int i = 0; i < brojPodela; i++)
    {
        pocetakNizaA = krajNizaA;                    /// novi pocetak niza a je njegov prethodni kraj, tj nastavljamo tamo gde smo stali prethnodi put
        krajNizaA   += velicinaPodele[i];            /// kraj niza a je sada prethodni kraj plus velicina podele

        niti[i] = thread(jesu_li_isti_elementi, pocetakNizaA, krajNizaA, krajNizaB, ref(rezultati[i]));

        krajNizaB   += velicinaPodele[i];           /// novi pocetak niza b, je stari kraj niza b plus velicina podela (u trenutnom i-tom koraku)
    }

    for(int i = 0; i < brojPodela; i++)
        niti[i].join();

    if(zbirPodelaElemenata < velicina)              /// ako je podela bila neravnomerna, poslednja nit ce obradjivati od prethodnog kraja niza a
    {                                               /// pa sve do kraja niza a tj a.cend();
        niti[brojPodela] = thread(jesu_li_isti_elementi,
                                  pocetakNizaA + velicinaPodele[brojPodela],
                                  a.cend(), krajNizaB + velicinaPodele[brojPodela], ref(rezultati[brojPodela]));
        niti[brojPodela].join();
    }

    delete[] niti;                                 /// oslobadjanje memorije koju smo dinamicki zauzeli za niti

    for(int i = 0; i < brojPodela; i++)            /// ako se ijedan od elemenata razlikuje, iskacemo i vracamo netacno
        if(rezultati[i] == false)
            return false;

    if(zbirPodelaElemenata < velicina && rezultati[brojPodela] == false)
        return false;

    /// IDEJA 2: moze i kao suma rezultata i ako je suma == a.size() onda su nizovi isti, true = 1, false = 0;
    return true;                                  /// ako su svi rezultati tacni tj svaki element iz oba vektora se podudara, vracamo tacno
}

#endif //_1234_DEO_A_H
