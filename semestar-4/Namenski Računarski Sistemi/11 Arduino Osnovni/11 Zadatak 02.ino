/* Kreirati program koji koristeci task blink_task1 pali i gasi lampicu
LD8 na pinu 33 u zavisnosti od dugmeta BTN4 na pinu 37.
• Pratiti stanje dugmeta BTN4 i otkriti da li je stisnut duze od 2 sekunde. Po
uocavanju ovakvog dogadjaja, na silaznoj ivici programski resetovati plocu uc32
• Koristiti primitive millis i executeSoftReset
• Promenu stanja dugmeta pratiti na svakih 50 ms i ukoliko je stanje razlicito od
prethodnog, prepoznati promenu stanja
*/

void blink_task1(int id, void *tptr)
{
    static int pocetak = millis();
    static int period  = 0;
    int stanjeDugmeta4 = digitalRead(37);

    if(stanjeDugmeta4 == HIGH)
    {
        digitalWrite(33, HIGH);
        period         = millis() - pocetak;
    }
    else
    {
        digitalWrite(33, LOW);

        if(period > 2000)
        {
            pocetak    = millis();
            period     = 0;
            executeSoftReset(0);
        }
        else
        {
            pocetak    = millis();
            period     = 0;
        }
    }
}

void setup()
{
    Serial.begin(9600);

    pinMode(33, OUTPUT);
    createTask(blink_task1, 50, TASK_ENABLE, NULL);
}

void loop()
{

}