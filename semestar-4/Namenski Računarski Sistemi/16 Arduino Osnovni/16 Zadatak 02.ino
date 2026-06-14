/*
    Napisati program koji:
    
    - Postavlja lampice na pinovima 26-33 kao izlazne pinove i inicijalizuje
	  komunikaciju sa serijskim monitorom na 9600bps

    - Sadrži promenljivu br, inicijalno postavljenu na 0 u kojoj će biti sumirane
      vrednosti sa analognog ulaza A0
	  
	- Sadrži task koji prilikom pritiska na dugme na pinu 4, ukoliko je dugme držano
	  duže od 2 sekunde, povećava vrednost brojača br za vrednost pročitanu sa
	  analognog ulaza A0 i ispisuje brojač na serijski monitor
	  
	- Sadrži interapt koji se startuje pri paljenju prekidača na pinu 2, čita vrednost
	  analognog ulaza, skalira je na vrednost od 0 do 255 i dobijeni broj prikazuje na
      lampicama 26-33 u binarnom obliku
	  
	- Sadrži task koji učitava broj sa serijskog monitora, ukoliko postoji, i ukoliko je taj
	  broj manji od brojača br, onemogućuje task za kontrolu dugmeta iz stavke 3.
	  Ispisati odgovarajuću poruku na serijski izlaz
 */
int br = 0;
int staroStanje = 0;
int startTime = millis();
int proteklo = 0;
int pritisakId;

void pritisakDugmeta(int id, void *tptr)
{
    int novoStanje = digitalRead(4);
    if(staroStanje == 1 && novoStanje == 0)
    {
        if(millis() - proteklo > 2000)
        {
            br += analogRead(A0);
            Serial.println(br);
        }
    }
    else if(staroStanje == 0 && novoStanje == 1)
    {
        proteklo = millis();
    }

    staroStanje = novoStanje;
}

void interapOn()
{
    int broj = analogRead(A0);
    broj = map(broj, 0, 1023, 0, 255);

    for(int i = 26; i <= 33; i++)
    {
        ///         II NACIN  /////// ///
        /// if(broj % 2 != 0)
        ///    digitalWrite(i, HIGH);
        /// else
        ///    digitalWrite(i, LOW);
        /// ///////////////////////// ///
        digitalWrite(i, broj % 2 != 0);
        broj /= 2;
    }
}

void serijskiMonitor(int id, void *tptr)
{
    if(Serial.available())
    {
        auto unos = Serial.readString().c_str();
        int broj = atoi(unos);

        if(broj < br)
        {
            setTaskState(pritisakId, TASK_DISABLE);
            Serial.println((char *)"Pritisak onemogucen!");
        }
    }
}

void setup()
{
    for(int i = 26; i <= 33; i++)
        pinMode(i, OUTPUT);

    Serial.begin(9600);

    pritisakId = createTask(pritisakDugmeta, 50, TASK_ENABLE, NULL);
    attachInterrupt(1, interapOn, RISING);
    createTask(serijskiMonitor, 50, TASK_ENABLE, NULL);
}

void loop()
{

}
