/* Napisati program koji pali lampice na pinovima od 26 do 33 u
krug. Ukoliko je upaljen taster SW2 na pinu 7, rotirati lampice od manjih ka
vecim pinovima, a u suprotnom od vecih ka manjim
*/

void setup()
{
    Serial.begin(9600);

    for(int i = 26; i <= 33; i++)
        pinMode(i, OUTPUT);
}

void loop()
{
    static int i, j;
    int smer = digitalRead(7);

    if(smer)
        i = 26, j = 33;
    else
        i = 33, j = 26;

    while(true)
    {
        if(smer)
        {
            if(i > j)
                break;

            digitalWrite(i, HIGH);
            delay(100);
            digitalWrite(i, LOW);
            i++;
        }
        else
        {
            if(i < j)
                break;

            digitalWrite(i, HIGH);
            delay(100);
            digitalWrite(i, LOW);
            i--;
        }

    }
}