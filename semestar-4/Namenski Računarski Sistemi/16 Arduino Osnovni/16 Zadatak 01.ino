/*
     Napisati program koji:

     - Postavlja lampicu na pinu 26 kao izlazni pin i inicijalizuje komunikaciju sa
       serijskim monitorom na 9600bps

     - Sadrži globalnu promenljivu br koja može da ima vrednosti od 1 do 10.
       Inicijalna vrednost promenljive je 1. Postavlja task koji pali i gasi lampicu na
       pinu 26. Broj blinkanja u jednoj sekundi treba da bude jednak broju br

     - Prilikom pritiska na dugme na pinu 4 ispisuje period blinkanja lampice na
       serijski monitor. Prilikom puštanja dugmeta na pinu 4 menja frekvenciju
       blinkanja na vrednost br

     - Sadrži interapte vezane za prekidač 1 (pin 2) koji pri promeni stanja prekidača
       povećavaju vrednost promenljive br. Ukoliko br pređe vrednost 10, postaviti
       vrednost na 1. Promenu prepoznati koristeći 2 uvezana interapta sa različitim
       modovima paljenja

     - Napraviti task koji prati stanje na serijskom monitoru i ukoliko je učitan znak od
       0 do 9, u promenljivu br postavlja vrednost znaka uvećanu za 1 i menja period
       blinkanja lampice srazmeran broju br
*/

int br = 1, staroStanje = 0, blinkId;

void interruptOn();
void interruptOff();

void blink(int id, void *tptr)
{
    digitalWrite(26, !digitalRead(26));
}

void button(int id, void *tptr)
{
    int novoStanje = digitalRead(4);
    if(staroStanje == 1 && novoStanje == 0)
    {
        Serial.print((char *)"PERIOD: ");
        Serial.println(1000 / (2 * br));
    }
    else if(staroStanje == 0 && novoStanje == 1)
    {
        setTaskPeriod(blinkId, 1000 / (2 * br));
    }

    staroStanje = novoStanje;
}

void interruptOff()
{
    if(++br > 10)
        br = 1;

    detachInterrupt(1);
    attachInterrupt(1, interruptOn, FALLING);
}

void interruptOn()
{
    if(++br > 10)
        br = 1;

    detachInterrupt(1);
    attachInterrupt(1, interruptOff, RISING);
}

void serijskiMonitor(int id, void *tptr)
{
    if(Serial.available())
    {
        char znak = Serial.read();

        if(znak >= '0' && znak <= '9')
        {
            br = znak - '0' + 1;
            setTaskPeriod(blinkId, 1000 / (2 * br));
        }
    }
}

void setup()
{
    pinMode(26, OUTPUT);
    Serial.begin(9600);

    blinkId = createTask(blink, 1000 / (2 * br), TASK_ENABLE, NULL);
              createTask(button, 50, TASK_ENABLE, NULL);
              createTask(serijskiMonitor, 50, TASK_ENABLE, NULL);

    if(digitalRead(2))
        attachInterrupt(1, interruptOn,  FALLING);
    else
       attachInterrupt(1, interruptOff, RISING);
}

void loop()
{

}
