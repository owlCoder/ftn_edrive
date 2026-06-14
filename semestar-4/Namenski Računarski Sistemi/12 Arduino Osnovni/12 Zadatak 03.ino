/*
    Napisati task prekidac() koji proverava stanje prekidača na
    određenom pinu.
        - Ukoliko je prekidač upravo upaljen, startovati odredjenu funkciju bez
          parametara, a ukoliko je upravo ugašen startovati drugu funkciju

        - Task preko parametra prima pokazivač na strukturu koja u sebi sadrži pin
          prekidača, njegovo staro stanje, kao i dva pokazivača na funkcije koje treba da
          se startuju prilikom paljenja/gašenja prekidača

        - Koristeći dati task, omogućiti uvećanje globalnog brojača br na uzlaznoj ivici
          signala prekidača SW1 na pinu 2. Task startovati na svakih 50ms

        - Koristeći dati task, omogućiti ispis globalnog brojača br na serijski monitor na
          silaznoj liniji prekidača SW2 na pinu 7 . Task startovati na svakih 50ms
*/

typedef void funkcija();

typedef struct Podaci
{
  int pin_prekidac;
  int staroStanje;
  funkcija *f1;
  funkcija *f2;
} podaci;

Podaci s1, s2;
static int brojac = 0;

void uvecaj()  { brojac++; }
void stampaj() { Serial.println(brojac); }

void prekidac(int id, void *tptr)
{
  Podaci *s = (Podaci *) tptr;
  int novoStanje = digitalRead(s -> pin_prekidac);
  if( (s -> staroStanje == 1) && (novoStanje == 0) )
  {
      if(s -> f1)
        s -> f1();
      if(s -> f2)
        s -> f2();
  }
  else if( (s -> staroStanje == 0) && (novoStanje == 1) )
  {
      if(s -> f1)
        s -> f1();
      if(s -> f2)
        s -> f2();
  }
}

void setup()
{
  Serial.begin(9600);

  s1.pin_prekidac = 2;
  s1.staroStanje  = digitalRead(s1.pin_prekidac);
  s1.f1           = uvecaj;
  s1.f2           = NULL;
  createTask(prekidac, 50, TASK_ENABLE, &s1);

  s2.pin_prekidac = 7;
  s2.staroStanje  = digitalRead(s2.pin_prekidac);
  s2.f1           = NULL;
  s2.f2           = stampaj;
  createTask(prekidac, 50, TASK_ENABLE, &s2);
}

void loop()
{

}